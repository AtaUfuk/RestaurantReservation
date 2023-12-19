using Microsoft.Extensions.Configuration;

namespace RestaurantReservation.Common.Helpers
{
    public static class ConfigurationFileHelper
    {
        public static string GetConfigParamValue(string key)
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json", optional: false);
            IConfiguration config = builder.Build();
            return config.GetSection(key).Value;
        }
    }
}
