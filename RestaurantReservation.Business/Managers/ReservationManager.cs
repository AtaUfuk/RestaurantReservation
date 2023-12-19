using Azure.Core;
using Microsoft.AspNetCore.Http;
using RestaurantReservation.Business.Services;
using RestaurantReservation.Common;
using RestaurantReservation.Common.Helpers;
using RestaurantReservation.Common.Utilities;
using RestaurantReservation.Common.Utilities.Results;
using RestaurantReservation.Data.Entities;
using RestaurantReservation.DataAccess.Abstract;

namespace RestaurantReservation.Business.Managers
{
	public class ReservationManager : IReservationService
	{
		private readonly IReservationDal _repository;
		private readonly ILogService _logService;
		private readonly IEMailService _emailService;
		private readonly IHttpContextAccessor _httpContext;

        public ReservationManager(IReservationDal repository, ILogService logService, IEMailService emailService, IHttpContextAccessor httpContext)
        {
            _repository = repository;
            _logService = logService;
            _emailService = emailService;
            _httpContext = httpContext;
        }

        public IResult MakeReservation(Reservation model)
		{
			string resultMessage;
			_logService.AddInformationLog($"Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[{ReflecUtility.Reflect<Reservation>(model)}]", Common.Enums.Layers.Business, $"{this.GetType().Name}.AddReservation");
			int resultVal = 0;
			bool isSuccess = false;
			try
			{
				if (CheckReservationParameters(model, out resultMessage))
				{
					resultVal = _repository.InsertwithReturnParam<int>(model, "Id");
					if (resultVal > 0)
					{
						SendEmail(model.CustomerEmail, model.CustomerName, model.NumberOfGuests,resultVal,model.TableNumber,model.ReservationDate);
                        resultMessage = $"Rezervasyon kaydı başarılı bir şekilde tamamlanmıştır ve belirttiğiniz mail adresine onay maili gönderilmiştir.Bu mail içerisindeki linki tıklayarak rezervasyon işlemini tamamlanmış olacaktır.";
						isSuccess = true;
					}
					else
					{
						resultMessage = $"Rezervasyon oluşturma işlemi sırasında bir sorun ile karşılaşıldı, lütfen daha sonra tekrardan deneyiniz.";
					}
				}
				_logService.AddInformationLog(resultMessage, Common.Enums.Layers.Business, $"{this.GetType().Name}.AddReservation");
			}
			catch (Exception ex)
			{
				resultMessage = $"Rezervasyon işlemi sırasında bir sorun ile karşılaşıldı, lütfen daha sonra tekrardan deneyiniz.";
				_logService.AddErrorLog(ex.ToString(), Common.Enums.Layers.Business, $"{this.GetType().Name}.AddReservation");
			}
			return new Result(isSuccess, resultMessage);
		}

        private void SendEmail(string customerEmail, string customerName, int numberOfGuests,int reservationNumber,int tableNumber,DateTime reservationDate)
        {
			var request = _httpContext.HttpContext.Request;
			string urlPath = $"{request.Scheme}://{request.Host}/Reservation/Confirm/{reservationNumber}";
            string fromMail = ConfigurationFileHelper.GetConfigParamValue("MailSettings:FromMail");
            string smtpServer = ConfigurationFileHelper.GetConfigParamValue("MailSettings:SmtpServer");
            int smtpPort = int.Parse(ConfigurationFileHelper.GetConfigParamValue("MailSettings:SmtpPort"));
            string userName = ConfigurationFileHelper.GetConfigParamValue("MailSettings:UserName");
            string password = ConfigurationFileHelper.GetConfigParamValue("MailSettings:Password");
            bool enableSsl = bool.Parse(ConfigurationFileHelper.GetConfigParamValue("MailSettings:EnableSsl"));
            string mailText = $"Sayın {customerName}, rezervasyonunuz başarıyla alındı. Masa No: {tableNumber}, Tarih: {reservationDate.ToShortDateString()}, Kişi Sayısı: {numberOfGuests},lütfen onaylamak için şu linki tıklayınız: {urlPath}";
            _emailService.SendEMail("Rezervasyon Onayı", mailText, fromMail, customerEmail, smtpServer, smtpPort, userName, password, enableSsl,out string mailErrorMessage);
			if(!string.IsNullOrWhiteSpace(mailErrorMessage))
			{
				_logService.AddErrorLog(mailErrorMessage, Common.Enums.Layers.Business, $"{this.GetType().Name}.SendEmail");
			}
        }

        public IObjResult<Reservation> GetReservation(int id)
		{
			_logService.AddInformationLog($"Rezervasyon bilgilerini getirme işlemi ekli parametre ile başlamıştır.id:[{id}]", Common.Enums.Layers.Business, $"{this.GetType().Name}.GetReservation");
			string resultMessage = string.Empty;
			Reservation? model = null;
			bool resultVal = false;
			try
			{
				model = _repository.Get(x => x.Id == id);
				if (model == null)
				{
					resultMessage = StaticValues.EmptyModelMessage;
				}
				else
				{
					resultVal = true;
					resultMessage = StaticValues.SuccessMessage;
				}
			}
			catch (Exception ex)
			{
				_logService.AddErrorLog(ex.ToString(), Common.Enums.Layers.Business, $"{this.GetType().Name}.GetReservation");
			}
			return new ObjResult<Reservation>(resultVal, resultMessage, model);
		}

		public IObjResult<List<Reservation>> GetReservations()
		{
			string resultMessage = string.Empty;
			List<Reservation>? model = null;
			bool resultVal = false;
			try
			{
				model = _repository.GetList(x => x.ReservationDate >= DateTime.Now, null, false);
				if (model == null)
				{
					resultMessage = StaticValues.EmptyModelMessage;
				}
				else
				{
					resultVal = true;
					resultMessage = StaticValues.SuccessMessage;
				}
			}
			catch (Exception ex)
			{
				_logService.AddErrorLog(ex.ToString(), Common.Enums.Layers.Business, $"{this.GetType().Name}.GetReservations");
			}
			return new ObjResult<List<Reservation>>(resultVal, resultMessage, model);
		}

		public IResult RemoveReservation(Reservation model)
		{
			_logService.AddInformationLog($"Rezervasyon silme işlemi ekli parametreler ile başlamıştır.Model:[{ReflecUtility.Reflect<Reservation>(model)}]", Common.Enums.Layers.Business, $"{this.GetType().Name}.RemoveReservation");
			string resultMessage;
			bool resultVal = false;
			try
			{
				resultVal = _repository.Delete(model);
				if (resultVal)
				{
					resultMessage = $"Rezervasyon silme işlemi tamamlanmıştır.İşlem sonucu:Başarılı.";
				}
				else
				{
					resultMessage = $"Rezervasyon silme işlemi tamamlanmıştır.İşlem sonucu:Başarısız.";
				}
				_logService.AddInformationLog(resultMessage, Common.Enums.Layers.Business, $"{this.GetType().Name}.RemoveReservation");
			}
			catch (Exception ex)
			{
				_logService.AddErrorLog(ex.ToString(), Common.Enums.Layers.Business, $"{this.GetType().Name}.RemoveReservation");
			}
			return new Result(resultVal);
		}

		public IResult SaveReservation(Reservation model)
		{
			_logService.AddInformationLog($"Rezervasyon güncelleme işlemi ekli parametreler ile başlamıştır.Model:[{ReflecUtility.Reflect<Reservation>(model)}]", Common.Enums.Layers.Business, $"{this.GetType().Name}.UpdateReservation");
			bool resultVal = false;
			string resultMessage;
			try
			{
				resultVal = _repository.UpdateParts(model);
				if (resultVal)
				{
					resultMessage = $"Rezervasyon işlemi başarıyla tamamlanmıştır.";
				}
				else
				{
					resultMessage = $"Rezervasyonun tamamlanması esnasında bir sorun ile karşılaşıldı, lütfen daha sonra tekrardan deneyiniz.";
				}
				_logService.AddInformationLog(resultMessage, Common.Enums.Layers.Business, $"{this.GetType().Name}.UpdateReservation");
			}
			catch (Exception ex)
			{
				_logService.AddErrorLog(ex.ToString(), Common.Enums.Layers.Business, $"{this.GetType().Name}.UpdateReservation");
			}
			return new Result(resultVal);
		}

		private bool CheckReservationParameters(Reservation model, out string resultMessage)
		{
			bool result = true;
			string message = string.Empty;
			if (model.ReservationDate.Date < DateTime.Now.Date)
			{
				message += "Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.";
				result = false;
			}
			if (model.NumberOfGuests < 2 || model.NumberOfGuests > 12)
			{
				message += "Rezervasyon için verilen kişi sayısı en az 2, en fazla 12 olmalıdır.";
				result = false;
			}
			if (model.TableNumber <= 0)
			{
				message += "Rezervasyon için uygun masa bulunamamıştır.";
				result = false;
			}
			resultMessage = message;
			return result;
		}
	}
}
