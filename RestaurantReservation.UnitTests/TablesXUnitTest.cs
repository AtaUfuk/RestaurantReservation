using Moq;
using NuGet.Frameworks;
using RestaurantReservation.Business.Managers;
using RestaurantReservation.Business.Services;
using RestaurantReservation.DataAccess.Abstract;

namespace RestaurantReservation.UnitTests
{
	public class TablesXUnitTest
	{
		[Fact]
		public void DateErrorTest()
		{
			var repositoryMock = new Mock<ITablesDal>();
			var logServiceMock = new Mock<ILogService>();
			var tableManager=new TablesManager(repositoryMock.Object,logServiceMock.Object);
			var result=tableManager.GetAvaibles(DateTime.Now.AddDays(-1),4);
			Assert.False(result.IsSuccess);
			Assert.Contains("ileriki bir tarih", result.Message);
		}
	}
}
