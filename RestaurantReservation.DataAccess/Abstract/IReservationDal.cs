using RestaurantReservation.Core.DataAccess;
using RestaurantReservation.Data.Entities;

namespace RestaurantReservation.DataAccess.Abstract
{
	public interface IReservationDal : IEntityRepository<Reservation>
	{
	}
}
