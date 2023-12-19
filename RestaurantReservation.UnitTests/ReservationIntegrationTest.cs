using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Moq;
using RestaurantReservation.Business.Managers;
using RestaurantReservation.Business.Services;
using RestaurantReservation.Data.Entities;
using RestaurantReservation.DataAccess.Abstract;
using RestaurantReservation.DataAccess.Concrete.EntityFramework;

namespace RestaurantReservation.UnitTests
{
	public class ReservationIntegrationTest
	{
		//private readonly RestaurantReservationDbContext _dbContext;

		//public ReservationIntegrationTest()
		//{
		//	// InMemoryDatabase kullanarak test veritabanını başlat
		//	var options = new DbContextOptionsBuilder<RestaurantReservationDbContext>()
		//		.UseInMemoryDatabase(databaseName: "TestDatabase")
		//		.Options;

		//	_dbContext = new RestaurantReservationDbContext();
		//	_dbContext.Add<DbContextOptions>(options);
		//	_dbContext.Database.EnsureCreated(); // Veritabanını oluştur
		//}

		//[Fact]
		//public void SuccessTest()
		//{
		//	var logServiceMock = new Mock<ILogService>();
		//	var emailServiceMock = new Mock<IEMailService>();
		//	var httpContextMock = new Mock<IHttpContextAccessor>();
		//	var httpRequestMock = new Mock<HttpRequest>();

		//	httpRequestMock.Setup(req => req.Scheme).Returns("https");
		//	httpRequestMock.Setup(req => req.Host).Returns(new HostString("localhost"));
		//	httpRequestMock.Setup(req => req.Path).Returns(new PathString("/"));

		//	var contextMock = new Mock<HttpContext>();
		//	contextMock.Setup(ctx => ctx.Request).Returns(httpRequestMock.Object);

		//	httpContextMock.Setup(ctx => ctx.HttpContext).Returns(contextMock.Object);
		//	// Arrange
		//	var reservationManager = new ReservationManager(new ReservationDal(), logServiceMock.Object, emailServiceMock.Object, httpContextMock.Object);

		//	var reservation = new Reservation
		//	{
		//		CustomerEmail = "ufukata34@gmail.com",
		//		NumberOfGuests = 4,
		//		ReservationDate = DateTime.Now,
		//		TableNumber = 3,
		//		CustomerName = "Ufuk Ata",
		//	};

		//	// Act
		//	var result = reservationManager.MakeReservation(reservation);

		//	// Assert
		//	Assert.True(result.IsSuccess);
		//	Assert.Contains("Rezervasyon kaydı başarılı bir şekilde tamamlanmıştır", result.Message);
		//	this.Dispose();
		//}

		//public void Dispose()
		//{
		//	// Test veritabanını temizle
		//	_dbContext.Database.EnsureDeleted();
		//	_dbContext.Dispose();
		//}

		[Fact]
		public void SuccessTest()
		{
			var repositoryMock = new Mock<IReservationDal>();
			repositoryMock.Setup(repo => repo.InsertwithReturnParam<int>(It.IsAny<Reservation>(), It.IsAny<string>())).Returns(11);

			var logServiceMock = new Mock<ILogService>();
			var emailServiceMock = new Mock<IEMailService>();
			var httpContextMock = new Mock<IHttpContextAccessor>();
			var httpRequestMock = new Mock<HttpRequest>();

			httpRequestMock.Setup(req => req.Scheme).Returns("https");
			httpRequestMock.Setup(req => req.Host).Returns(new HostString("localhost"));
			httpRequestMock.Setup(req => req.Path).Returns(new PathString("/"));

			var contextMock = new Mock<HttpContext>();
			contextMock.Setup(ctx => ctx.Request).Returns(httpRequestMock.Object);

			httpContextMock.Setup(ctx => ctx.HttpContext).Returns(contextMock.Object);
			var reservationManager = new ReservationManager(repositoryMock.Object, logServiceMock.Object, emailServiceMock.Object, httpContextMock.Object);
			var reservation = new Reservation
			{
				CustomerEmail = "ufukata34@gmail.com",
				NumberOfGuests = 4,
				ReservationDate = DateTime.Now,
				TableNumber = 3,
				CustomerName = "Ufuk Ata",
			};

			var result = reservationManager.MakeReservation(reservation);
			Assert.True(result.IsSuccess);
			Assert.Contains("Rezervasyon kaydı başarılı bir şekilde tamamlanmıştır", result.Message);
		}
	}
}
