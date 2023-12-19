using RestaurantReservation.Business.Services;
using System.Net;
using System.Net.Mail;

namespace RestaurantReservation.Business.Managers
{
	/// <summary>
	/// Smtp Şifre: ukgv axtq sxbb wvtm
	/// </summary>
	public class EmailManager : IEMailService
	{
		public bool SendEMail(string subject, string message, string fromMail, string toMail, string smtpServer, int smtpPort, string userName, string password, bool enableSsl, out string exceptionMessage)
		{
			bool result = false;
			exceptionMessage = string.Empty;
			try
			{
				MailMessage mail = new()
				{
					IsBodyHtml = true,
					From = new MailAddress(fromMail),
					Subject = subject,
					Body = message,
				};
				mail.To.Add(new MailAddress(toMail));
				SmtpClient smtpClient = new(smtpServer)
				{
					Port = smtpPort,
					Credentials = new NetworkCredential(userName, password),
					UseDefaultCredentials = false,
					DeliveryMethod = SmtpDeliveryMethod.Network,
					EnableSsl = enableSsl,
					Timeout = 10000,
				};
				smtpClient.Send(mail);
				result = true;
			}
			catch (Exception ex)
			{
				exceptionMessage = ex.ToString();
			}
			return result;
		}
	}
}
