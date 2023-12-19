using RestaurantReservation.Core.Entities;

namespace RestaurantReservation.Data.Entities
{
	public class Reservation : IEntity
	{
		public int Id { get; set; }
		public string CustomerName { get; set; }
		public string CustomerEmail { get; set; }
		public DateTime ReservationDate { get; set; }
		public int NumberOfGuests { get; set; }
		public int TableNumber { get; set; }
		public bool IsActive { get; set; }
	}
}
