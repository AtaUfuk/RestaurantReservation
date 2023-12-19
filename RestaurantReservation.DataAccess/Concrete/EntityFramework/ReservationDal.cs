using RestaurantReservation.Core.DataAccess.EntityFramework;
using RestaurantReservation.Data.Entities;
using RestaurantReservation.DataAccess.Abstract;

namespace RestaurantReservation.DataAccess.Concrete.EntityFramework
{
	public class ReservationDal : EFRepositoryBase<Reservation, RestaurantReservationDbContext>, IReservationDal
	{
	}
}
