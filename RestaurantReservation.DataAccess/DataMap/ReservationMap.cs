using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RestaurantReservation.Data.Entities;

namespace RestaurantReservation.DataAccess.DataMap
{
	public class ReservationMap : IEntityTypeConfiguration<Reservation>
	{
		public void Configure(EntityTypeBuilder<Reservation> builder)
		{
			builder.HasKey(x => x.Id);
			builder.Property(x=>x.CustomerName).HasMaxLength(255).IsRequired();
			builder.Property(x => x.ReservationDate).HasColumnType("datetime").HasDefaultValueSql("GETDATE()");
			builder.Property(x => x.CustomerEmail).HasMaxLength(255).IsRequired();
		}
	}
}
