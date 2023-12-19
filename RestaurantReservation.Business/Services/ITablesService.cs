using RestaurantReservation.Common.Utilities.Results;
using RestaurantReservation.Data.Entities;

namespace RestaurantReservation.Business.Services
{
	public interface ITablesService
	{
		IObjResult<List<Tables>> GetAll();
		IObjResult<List<Tables>> GetAvaibles(DateTime date,int guests);
		IResult AddTable(Tables model);
		IResult RemoveTable(Tables model);
		IResult UpdateTable(Tables model);
	}
}
