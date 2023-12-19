using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RestaurantReservation.Data.Entities;

namespace RestaurantReservation.DataAccess.DataMap
{
	public class LogMap : IEntityTypeConfiguration<Log>
	{
		public void Configure(EntityTypeBuilder<Log> builder)
		{
			builder.HasKey(x => x.Id);
			builder.Property(x => x.CreatedDate).HasDefaultValueSql("GETDATE()");
			builder.Property(x => x.MethodName);
		}
	}
}
