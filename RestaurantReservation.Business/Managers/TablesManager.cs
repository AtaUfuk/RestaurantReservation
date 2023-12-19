using RestaurantReservation.Business.Services;
using RestaurantReservation.Common;
using RestaurantReservation.Common.Utilities;
using RestaurantReservation.Common.Utilities.Results;
using RestaurantReservation.Data.Entities;
using RestaurantReservation.DataAccess.Abstract;
using System.Data;
using Microsoft.Data.SqlClient;

namespace RestaurantReservation.Business.Managers
{
    public class TablesManager : ITablesService
    {
        private readonly ITablesDal _repository;
        private readonly ILogService _logService;

        public TablesManager(ITablesDal repository, ILogService logService)
        {
            _repository = repository;
            _logService = logService;
        }

        public IResult AddTable(Tables model)
        {
            string resultMessage = string.Empty;
            bool resultVal = false;
            try
            {
                _logService.AddInformationLog($"Masa ekleme işlemi ekli parametreler ile başlamıştır.Model:[{ReflecUtility.Reflect<Tables>(model)}]", Common.Enums.Layers.Business, $"{this.GetType().Name}.AddTable");
                resultVal = _repository.Insert(model);
                if (resultVal)
                {
                    resultMessage = $"Masa ekleme işlemi tamamlanmıştır.İşlem sonucu:Başarılı.";
                }
                else
                {
                    resultMessage = $"Masa ekleme işlemi tamamlanmıştır.İşlem sonucu:Başarısız.";
                }
                _logService.AddInformationLog(resultMessage, Common.Enums.Layers.Business, $"{this.GetType().Name}.AddTable");
            }
            catch (Exception ex)
            {
                _logService.AddErrorLog(ex.ToString(), Common.Enums.Layers.Business, $"{this.GetType().Name}.AddTable");
            }
            return new Result(resultVal, resultMessage);
        }

        public IObjResult<List<Tables>> GetAll()
        {
            string resultMessage = string.Empty;
            List<Tables> model = null;
            bool resultVal = false;
            try
            {
                model = _repository.GetList(null, null, false);
                if (model == null)
                {
                    resultMessage = StaticValues.EmptyModelMessage;
                }
                else
                {
                    resultVal = true;
                    resultMessage = StaticValues.SuccessMessage;
                }
            }
            catch (Exception ex)
            {
                _logService.AddErrorLog(ex.ToString(), Common.Enums.Layers.Business, $"{this.GetType().Name}.GetAll");
            }
            return new ObjResult<List<Tables>>(resultVal, resultMessage, model);
        }

        public IObjResult<List<Tables>> GetAvaibles(DateTime date, int guests)
        {
            _logService.AddInformationLog($"Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:{date},Misafir Sayısı:{guests}", Common.Enums.Layers.Business, $"{this.GetType().Name}.GetAvaibles");
            string resultMessage = string.Empty;
            List<Tables> model = null;
            bool resultVal = false;
            try
            {
                SqlParameter DateParam = new()
                {
                    ParameterName = "Date",
                    SqlDbType = SqlDbType.DateTime,
                    Value = date.Date
                };
                SqlParameter CapacityParam = new()
                {
                    ParameterName = "Guests",
                    SqlDbType = SqlDbType.Int,
                    Value = guests
                };
                model = _repository.GetListwithSql("exec SpGetAvaibleTable", true, DateParam, CapacityParam);
                //model = _repository.GetListwithSql("SELECT tbl.Id,tbl.Number,tbl.Capacity FROM [Tables] tbl left join Reservation r on tbl.Number=r.TableNumber and r.ReservationDate=@Date WHERE r.TableNumber is null and tbl.Capacity=@Guests order by tbl.Capacity", false, DateParam, CapacityParam);
                if (model == null || model.Count == 0)
                {
                    resultMessage = StaticValues.ErrorTableNotFound;
                }
                else
                {
                    resultVal = true;
                    resultMessage = StaticValues.SuccessMessage;
                }
                _logService.AddInformationLog(resultMessage, Common.Enums.Layers.Business, $"{this.GetType().Name}.GetAvaibles");
            }
            catch (Exception ex)
            {
                _logService.AddErrorLog(ex.ToString(), Common.Enums.Layers.Business, $"{this.GetType().Name}.GetAvaibles");
            }
            return new ObjResult<List<Tables>>(resultVal, resultMessage, model);
        }

        public IResult RemoveTable(Tables model)
        {
            _logService.AddInformationLog($"Masa silme işlemi ekli parametreler ile başlamıştır.Model:[{ReflecUtility.Reflect<Tables>(model)}]", Common.Enums.Layers.Business, $"{this.GetType().Name}.RemoveTable");
            string resultMessage = string.Empty;
            bool resultVal = false;
            try
            {
                resultVal = _repository.Delete(model);
                if (resultVal)
                {
                    resultMessage = $"Masa silme işlemi tamamlanmıştır.İşlem sonucu:Başarılı.";
                }
                else
                {
                    resultMessage = $"Masa silme işlemi tamamlanmıştır.İşlem sonucu:Başarısız.";
                }
                _logService.AddInformationLog(resultMessage, Common.Enums.Layers.Business, $"{this.GetType().Name}.RemoveTable");
            }
            catch (Exception ex)
            {
                _logService.AddErrorLog(ex.ToString(), Common.Enums.Layers.Business, $"{this.GetType().Name}.RemoveTable");
            }
            return new Result(resultVal);
        }

        public IResult UpdateTable(Tables model)
        {
            _logService.AddInformationLog($"Masa güncelleme işlemi ekli parametreler ile başlamıştır.Model:[{ReflecUtility.Reflect<Tables>(model)}]", Common.Enums.Layers.Business, $"{this.GetType().Name}.UpdateTable");
            bool resultVal = false;
            string resultMessage = string.Empty;
            try
            {
                resultVal = _repository.UpdateParts(model);
                if (resultVal)
                {
                    resultMessage = $"Masa güncelleme işlemi tamamlanmıştır.İşlem sonucu:Başarılı.";
                }
                else
                {
                    resultMessage = $"Masa güncelleme işlemi tamamlanmıştır.İşlem sonucu:Başarısız.";
                }
                _logService.AddInformationLog(resultMessage, Common.Enums.Layers.Business, $"{this.GetType().Name}.UpdateTable");
            }
            catch (Exception ex)
            {
                _logService.AddErrorLog(ex.ToString(), Common.Enums.Layers.Business, $"{this.GetType().Name}.UpdateTable");
            }
            return new Result(resultVal);
        }
    }
}
