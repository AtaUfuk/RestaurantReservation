using RestaurantReservation.Core.Entities;

namespace RestaurantReservation.Data.Entities
{
	public class Log : IEntity
	{
		public int Id { get; set; }
		public int Severity { get; set; }
		public string Message { get; set; }
		public DateTime CreatedDate { get; set; }
		public int Layer { get; set; }
		public string MethodName { get;set; }
	}
}
