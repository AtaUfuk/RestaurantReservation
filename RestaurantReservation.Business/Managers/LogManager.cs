using RestaurantReservation.Business.Services;
using RestaurantReservation.Common.Enums;
using RestaurantReservation.Data.Entities;
using RestaurantReservation.DataAccess.Abstract;

namespace RestaurantReservation.Business.Managers
{
	public class LogManager : ILogService
	{
		private readonly ILogDal _repository;

		public LogManager(ILogDal repository)
		{
			_repository = repository;
		}

		public void AddInformationLog(string message, Layers layer, string methodName)
		{
			Log log = new()
			{
				Message = message,
				Severity = (int)Severities.Information,
				Layer = (int)layer,
				MethodName = methodName
			};
			AddLog(log);
		}

		public void AddWarningLog(string message, Layers layer, string methodName)
		{
			Log log = new()
			{
				Message = message,
				Severity = (int)Severities.Warning,
				Layer = (int)Layers.Business,
				MethodName = methodName
			};
			AddLog(log);
		}

		public void AddErrorLog(string message, Layers layer, string methodName)
		{
			Log log = new()
			{
				Message = message,
				Severity = (int)Severities.Error,
				Layer = (int)layer,
				MethodName = methodName
			};
			AddLog(log);
		}

		private void AddLog(Log model)
		{
			_repository.Insert(model);
		}
	}
}
