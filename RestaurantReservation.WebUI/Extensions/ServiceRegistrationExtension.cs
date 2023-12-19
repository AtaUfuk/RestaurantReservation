using RestaurantReservation.Business.Managers;
using RestaurantReservation.Business.Services;
using RestaurantReservation.DataAccess.Abstract;
using RestaurantReservation.DataAccess.Concrete.EntityFramework;

namespace RestaurantReservation.WebUI.Extensions
{
	public static class ServiceRegistrationExtension
	{
		public static void AddCustomServices(this IServiceCollection services)
		{
            #region Business Layer's
            services.AddScoped<ITablesService,TablesManager>();
			services.AddScoped<IReservationService, ReservationManager>();
			services.AddScoped<IEMailService, EmailManager>();
			services.AddScoped<ILogService, LogManager>();
            #endregion
            #region DataAccess Layer's
            services.AddScoped<ITablesDal,TablesDal>();
			services.AddScoped<IReservationDal, ReservationDal>();
			services.AddScoped<ILogDal, LogDal>();
            #endregion
            #region Microsoft's Middlewares
            services.AddHttpContextAccessor();
            #endregion
        }
    }
}
