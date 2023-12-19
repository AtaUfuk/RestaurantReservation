using RestaurantReservation.Core.DataAccess.EntityFramework;
using RestaurantReservation.Data.Entities;
using RestaurantReservation.DataAccess.Abstract;

namespace RestaurantReservation.DataAccess.Concrete.EntityFramework
{
	public class LogDal : EFRepositoryBase<Log, RestaurantReservationDbContext>, ILogDal
	{
	}
}
