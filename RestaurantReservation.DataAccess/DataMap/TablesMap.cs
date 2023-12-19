using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RestaurantReservation.Data.Entities;

namespace RestaurantReservation.DataAccess.DataMap
{
	public class TablesMap : IEntityTypeConfiguration<Tables>
	{
		public void Configure(EntityTypeBuilder<Tables> builder)
		{
			builder.HasKey(x=>x.Id);
			builder.Property(x=>x.Number).IsRequired();
		}
	}
}
