using Microsoft.Extensions.Configuration;

namespace RestaurantReservation.DataAccess.Helpers
{
	public static class ConnStringHelper
	{
		public static string GetConnectionStr()
		{
			var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json", optional: false);
			IConfiguration config = builder.Build();
			return config.GetConnectionString(config.GetSection("Environment").Value + "Connection");
		}
	}
}
