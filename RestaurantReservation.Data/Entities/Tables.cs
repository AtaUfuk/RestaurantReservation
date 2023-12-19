using RestaurantReservation.Core.Entities;

namespace RestaurantReservation.Data.Entities
{
	public class Tables : IEntity
	{
		public int Id { get; set; }
		public int Number { get; set; }
		public int Capacity { get; set; }
	}
}
