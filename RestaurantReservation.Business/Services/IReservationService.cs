using RestaurantReservation.Common.Utilities.Results;
using RestaurantReservation.Data.Entities;

namespace RestaurantReservation.Business.Services
{
	public interface IReservationService
	{
		IObjResult<List<Reservation>> GetReservations();
		IObjResult<Reservation> GetReservation(int id);
		IResult MakeReservation(Reservation model);
		IResult RemoveReservation(Reservation model);
		IResult SaveReservation(Reservation model);
	}
}
