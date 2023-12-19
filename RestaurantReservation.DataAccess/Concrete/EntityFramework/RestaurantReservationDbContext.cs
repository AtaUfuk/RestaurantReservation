using Microsoft.EntityFrameworkCore;
using RestaurantReservation.Data.Entities;
using RestaurantReservation.DataAccess.DataMap;
using RestaurantReservation.DataAccess.Helpers;

namespace RestaurantReservation.DataAccess.Concrete.EntityFramework
{
	public class RestaurantReservationDbContext : DbContext
	{
		protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
		{
			optionsBuilder.UseSqlServer(ConnStringHelper.GetConnectionStr());
		}

		public virtual DbSet<Tables> Tables { get; set; }
		public virtual DbSet<Reservation> Reservation { get; set; }
		public virtual DbSet<Log> Log { get; set; }

		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			modelBuilder.ApplyConfiguration(new TablesMap());
			modelBuilder.ApplyConfiguration(new ReservationMap());
			modelBuilder.ApplyConfiguration(new LogMap());
		}
	}
}
