using RestaurantReservation.Common.Enums;

namespace RestaurantReservation.Business.Services
{
	public interface ILogService
	{
		void AddInformationLog(string message, Layers layer,string methodName);
		void AddWarningLog(string message, Layers layer, string methodName);
		void AddErrorLog(string message, Layers layer, string methodName);
	}
}
