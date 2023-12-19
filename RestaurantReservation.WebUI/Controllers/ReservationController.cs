using Microsoft.AspNetCore.Mvc;
using RestaurantReservation.Business.Services;
using RestaurantReservation.Common;
using RestaurantReservation.Common.Helpers;
using RestaurantReservation.Common.Utilities;
using RestaurantReservation.Common.Utilities.Results;
using RestaurantReservation.Data.Entities;
using RestaurantReservation.WebUI.Models;

namespace RestaurantReservation.WebUI.Controllers
{
	public class ReservationController : Controller
	{
		private readonly ITablesService _tablesService;
		private readonly IReservationService _reservationService;
		private readonly IEMailService _emailService;
		private readonly ILogService _logService;

		public ReservationController(ITablesService tablesService, IReservationService reservationService, IEMailService emailService, ILogService logService)
		{
			_tablesService = tablesService;
			_reservationService = reservationService;
			_emailService = emailService;
			_logService = logService;
		}

		public IActionResult Index()
		{
			return View();
		}
		[HttpPost]
		public IActionResult Index(ReservationModel model)
		{
			_logService.AddInformationLog($"Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[{ReflecUtility.Reflect<ReservationModel>(model)}]", Common.Enums.Layers.Web, $"{this.GetType().Name}.Index(POST)");
			if (ModelState.IsValid)
			{
				int? tableNumber = _tablesService.GetAvaibles(model.ReservationDate, model.NumberOfGuests)?.Object?.FirstOrDefault()?.Number;
				if (tableNumber == null)
				{
					model.Result = false;
					model.ResultMessage = StaticValues.ErrorTableNotFound;
				}
				else
				{
					Reservation reservation = new()
					{
						ReservationDate = model.ReservationDate,
						CustomerName = model.CustomerName,
						TableNumber = tableNumber ?? 0,
						NumberOfGuests = model.NumberOfGuests,
						CustomerEmail = model.Email
					};
					var result = _reservationService.MakeReservation(reservation);
					if (result != null)
					{
						model.Result = result.IsSuccess;
						model.ResultMessage = result.Message;
					}
					else
					{
						model.Result = false;
						model.ResultMessage = StaticValues.ErrorMessage;
					}
				}
			}

			return View(model);
		}

		public IActionResult Confirm(int id)
		{
			ConfirmModel confirm = new();
			if (id > 0)
			{
				var reservation = _reservationService.GetReservation(id);
				if (reservation != null && reservation.IsSuccess)
				{
					var model = reservation.Object;
					model.IsActive = true;
					var result = _reservationService.SaveReservation(model);
					confirm.Message = result.Message;
				}
			}
			else
			{
				confirm.Message = StaticValues.EmptyModelMessage;
			}
			return View(confirm);
		}
	}
}
