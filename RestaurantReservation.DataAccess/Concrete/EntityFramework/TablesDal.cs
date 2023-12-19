using RestaurantReservation.Core.DataAccess.EntityFramework;
using RestaurantReservation.Data.Entities;
using RestaurantReservation.DataAccess.Abstract;

namespace RestaurantReservation.DataAccess.Concrete.EntityFramework
{
	public class TablesDal : EFRepositoryBase<Tables, RestaurantReservationDbContext>, ITablesDal
	{
		
	}
}
