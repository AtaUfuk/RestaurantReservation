namespace RestaurantReservation.Business.Services
{
	public interface IEMailService
	{
		bool SendEMail(string subject, string message, string fromMail, string toMail, string smtpServer, int smtpPort, string userName, string password, bool enableSsl, out string exceptionMessage);
	}
}
