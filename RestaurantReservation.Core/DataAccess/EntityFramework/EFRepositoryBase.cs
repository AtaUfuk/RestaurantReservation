using RestaurantReservation.Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using System.Text;
using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore.ChangeTracking.Internal;
using Microsoft.EntityFrameworkCore.Query;

namespace RestaurantReservation.Core.DataAccess.EntityFramework
{
    public class EFRepositoryBase<TEntity, TContext> : IEntityRepository<TEntity>, IEntity
        where TEntity : class, new()
        where TContext : DbContext, new()
    {
        public bool Delete(TEntity entity)
        {
            bool result;
            using TContext context = new();
            using var transaction = context.Database.BeginTransaction();
            try
            {
                var DeleteState = context.Entry<TEntity>(entity);
                DeleteState.State = EntityState.Deleted;
                int _result = context.SaveChanges();
                transaction.Commit();
                result = (_result > 0);
            }
            catch (Exception)
            {
                transaction.Rollback();
                throw;
            }
            return result;
        }

        public bool DeleteRange(List<TEntity> entity)
        {
            bool result;
            using TContext context = new();
            using var transaction = context.Database.BeginTransaction();
            try
            {
                var DeleteState = context.Entry<List<TEntity>>(entity);
                DeleteState.State = EntityState.Deleted;
                int _result = context.SaveChanges();
                transaction.Commit();
                result = (_result > 0);
            }
            catch (Exception)
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                transaction?.Dispose();
                context?.Dispose();
            }
            return result;
        }

        public bool DeletewithSql(string sqlQuery, bool isSp, params SqlParameter[] sqlParams)
        {
            bool result = false;
            using TContext context = new();
            using var transaction = context.Database.BeginTransaction();
            StringBuilder sbSqlString = new();
            try
            {
                sbSqlString.Append(sqlQuery);
                if (isSp)
                {
                    int count = 0;
                    foreach (SqlParameter item in sqlParams)
                    {
                        if (count == 0)
                        {
                            sbSqlString.Append(" " + item.ParameterName);
                        }
                        else
                        {
                            sbSqlString.Append("," + item.ParameterName);
                        }
                        count++;
                    }
                }
                int returnVal = context.Database.ExecuteSqlRaw(sqlQuery, sqlParams);
                if (returnVal > 0)
                {
                    result = true;
                    transaction.Commit();
                }
            }
            catch (Exception)
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                transaction?.Dispose();
                context?.Dispose();
            }
            return result;
        }

        public TEntity Get(Expression<Func<TEntity, bool>>? filters)
        {
            using TContext context = new();
            TEntity? result;
            try
            {
                if (filters != null)
                {
                    result = context.Set<TEntity>().Where(filters).FirstOrDefault();
                }
                else
                {
                    result = context.Set<TEntity>().FirstOrDefault();
                }
            }
            finally
            {
                context?.Dispose();
            }
            return result;
        }

        public List<TEntity> GetList(Expression<Func<TEntity, bool>>? filters, Expression<Func<TEntity, object>>? orderby, bool isDesc)
        {
            using TContext context = new();
            List<TEntity> result;
            try
            {
                if (filters == null)
                {
                    if (orderby == null)
                    {
                        result = context.Set<TEntity>().ToList();
                    }
                    else
                    {
                        if (!isDesc)
                        {
                            result = context.Set<TEntity>().OrderBy(orderby).ToList();
                        }
                        else
                        {
                            result = context.Set<TEntity>().OrderByDescending(orderby).ToList();
                        }
                    }
                }
                else
                {
                    if (orderby == null)
                    {
                        result = context.Set<TEntity>().Where(filters).ToList();
                    }
                    else
                    {
                        if (!isDesc)
                        {
                            result = context.Set<TEntity>().Where(filters).OrderBy(orderby).ToList();
                        }
                        else
                        {
                            result = context.Set<TEntity>().Where(filters).OrderByDescending(orderby).ToList();
                        }
                    }
                }
            }
            finally
            {
                context?.Dispose();
            }
            return result;
        }

        public List<TEntity> GetListSomeofThem(Expression<Func<TEntity, bool>>? filters, Expression<Func<TEntity, object>>? orderby, bool isDesc, int skip, int take)
        {
            using TContext context = new();
            List<TEntity> result;
            try
            {
                if (filters == null)
                {
                    if (orderby == null)
                    {
                        result = context.Set<TEntity>().Skip(skip).Take(take).ToList();
                    }
                    else
                    {
                        if (!isDesc)
                        {
                            result = context.Set<TEntity>().OrderBy(orderby).Skip(skip).Take(take).ToList();
                        }
                        else
                        {
                            result = context.Set<TEntity>().OrderByDescending(orderby).Skip(skip).Take(take).ToList();
                        }
                    }
                }
                else
                {
                    if (orderby == null)
                    {
                        result = context.Set<TEntity>().Where(filters).Skip(skip).Take(take).ToList();
                    }
                    else
                    {
                        if (!isDesc)
                        {
                            result = context.Set<TEntity>().Where(filters).OrderBy(orderby).Skip(skip).Take(take).ToList();
                        }
                        else
                        {
                            result = context.Set<TEntity>().Where(filters).OrderByDescending(orderby).Skip(skip).Take(take).ToList();
                        }
                    }
                }
            }
            finally
            {
                context?.Dispose();
            }
            return result;
        }

        public List<TEntity> GetListWithIncluded(Expression<Func<TEntity, bool>>? filters, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>>? orderBy, Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> include)
        {
            using TContext context = new();
            var entity = context.Set<TEntity>();
            var query = filters != null ? entity.Where(filters) : entity;
            if (include != null)
            {
                query = include(query);
            }
            if (orderBy != null)
            {
                query = orderBy(query);
            }
            return query.ToList();
        }

        public List<TEntity> GetListwithSql(string sqlQuery, bool isSp, params SqlParameter[] sqlParams)
        {
            List<TEntity>? result = null;
            using TContext context = new();
            StringBuilder sbSqlString = new();
            try
            {
                sbSqlString.Append(sqlQuery);
                if (isSp)
                {
                    int count = 0;
                    foreach (SqlParameter item in sqlParams)
                    {
                        if (count == 0)
                        {
                            sbSqlString.Append(" @" + item.ParameterName);
                            count++;
                        }
                        else
                        {
                            sbSqlString.Append(",@" + item.ParameterName);
                        }
                    }
                }
                string sql = sbSqlString.ToString();
                result = context.Set<TEntity>().FromSqlRaw(sql, sqlParams).ToList();
            }
            catch (Exception ex)
            {
                throw;
            }
            return result;
        }
        /// <summary>
        /// Get Entity Model's only selected columns by filters
        /// </summary>
        /// <typeparam name="TModel"></typeparam>
        /// <param name="columns"></param>
        /// <param name="filters"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public TModel GetModel<TModel>(Expression<Func<TEntity, TModel>> columns, Expression<Func<TEntity, bool>>? filters, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>>? orderBy = null) where TModel : class, new()
        {
            using TContext context = new();
            TModel? model = null;
            var query = filters != null ? context.Set<TEntity>().Where(filters) : context.Set<TEntity>();
            try
            {
                if (orderBy != null)
                {
                    query = orderBy(query);
                }
                model = query.Select<TEntity, TModel>(columns).FirstOrDefault();
            }
            finally
            {
                context?.Dispose();
            }
            return model;
        }

        public List<TModel> GetModelList<TModel>(Expression<Func<TEntity, TModel>> columns, Expression<Func<TEntity, bool>>? filters, Expression<Func<TEntity, object>>? orderby, bool isDesc) where TModel : class, new()
        {
            using TContext context = new();
            List<TModel> model;
            try
            {
                if (filters != null)
                {
                    if (orderby != null)
                    {
                        if (isDesc)
                        {
                            model = context.Set<TEntity>().Where(filters).OrderByDescending(orderby).Select<TEntity, TModel>(columns).ToList();
                        }
                        else
                        {
                            model = context.Set<TEntity>().Where(filters).OrderBy(orderby).Select<TEntity, TModel>(columns).ToList();
                        }
                    }
                    else
                    {
                        model = context.Set<TEntity>().Where(filters).Select<TEntity, TModel>(columns).ToList();
                    }

                }
                else
                {
                    if (orderby != null)
                    {
                        if (isDesc)
                        {
                            model = context.Set<TEntity>().OrderByDescending(orderby).Select<TEntity, TModel>(columns).ToList();
                        }
                        else
                        {
                            model = context.Set<TEntity>().OrderBy(orderby).Select<TEntity, TModel>(columns).ToList();
                        }
                    }
                    else
                    {
                        model = context.Set<TEntity>().Select<TEntity, TModel>(columns).ToList();
                    }

                }
            }
            finally
            {
                context?.Dispose();
            }
            return model;
        }

        public List<TModel> GetModelListSomeofThem<TModel>(Expression<Func<TEntity, TModel>> columns, Expression<Func<TEntity, bool>>? filters, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>>? orderBy, int skip, int take)
        {
            using TContext context = new();
            var query = filters != null ? context.Set<TEntity>().Where(filters) : context.Set<TEntity>();
            if (orderBy is not null)
            {
                query = orderBy(query);
            }
            return query.Select<TEntity, TModel>(columns).Skip(skip).Take(take).ToList();
        }
        [Obsolete(message: "Does not checked yet!!!")]
        public List<TModel> GetModelListWithIncluded<TModel>(Expression<Func<TEntity, TModel>> columns, Expression<Func<TEntity, bool>>? filters, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>>? orderBy, Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> include)
        {
            using TContext context = new();
            var entity = context.Set<TEntity>();
            var query = filters != null ? entity.Where(filters) : entity;
            if (include != null)
            {
                query = include(query);
            }
            if (orderBy != null)
            {
                query = orderBy(query);
            }
            return query.Select(columns).ToList();
        }

        public List<TModel> GetModelListwithSql<TModel>(string sqlQuery, bool isSp, params SqlParameter[] sqlParams) where TModel : class, new()
        {
            using TContext context = new();
            List<TModel>? models = null;
            StringBuilder sbSqlQuery = new();
            try
            {
                sbSqlQuery.Append(sqlQuery);
                if (isSp)
                {
                    int counter = 0;
                    foreach (var item in sqlParams)
                    {
                        if (counter == 0)
                        {
                            sbSqlQuery.Append(" " + item.ParameterName);
                            counter++;
                        }
                        else
                        {
                            sbSqlQuery.Append("," + item.ParameterName);
                        }
                    }
                }
                models = context.Set<TModel>().FromSqlRaw(sbSqlQuery.ToString(), sqlParams).ToList();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                context?.Dispose();
            }
            return models;
        }

        public TModel GetModelWithSql<TModel>(string sqlQuery, bool isSp, params SqlParameter[] sqlParams) where TModel : class, new()
        {
            using TContext context = new();
            TModel? model = null;
            StringBuilder sbSqlQuery = new();
            try
            {
                sbSqlQuery.Append(sqlQuery);
                if (isSp)
                {
                    int counter = 0;
                    foreach (var item in sqlParams)
                    {
                        if (counter == 0)
                        {
                            sbSqlQuery.Append(" " + item.ParameterName);
                            counter++;
                        }
                        else
                        {
                            sbSqlQuery.Append("," + item.ParameterName);
                        }
                    }
                }
                model = context.Set<TModel>().FromSqlRaw(sbSqlQuery.ToString(), sqlParams).FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                context?.Dispose();
            }
            return model;
        }

        public TEntity GetWithIncluded(Expression<Func<TEntity, bool>>? filters, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>>? orderBy, Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> include)
        {
            using TContext context = new();
            var entity = context.Set<TEntity>();
            var query = filters is not null ? entity.Where(filters) : entity;
            if (include is not null)
            {
                query = include(query);
            }
            if (orderBy is not null)
            {
                query = orderBy(query);
            }
            return query.FirstOrDefault();
        }

        public TEntity GetWithSql(string sqlQuery, bool isSp, params SqlParameter[] sqlParams)
        {
            TEntity? result = new();
            using TContext context = new();
            StringBuilder sbSqlString = new();
            try
            {
                sbSqlString.Append(sqlQuery);
                if (isSp)
                {
                    int count = 0;
                    foreach (SqlParameter item in sqlParams)
                    {
                        if (count == 0)
                        {
                            sbSqlString.Append(" " + item.ParameterName);
                            count++;
                        }
                        else
                        {
                            sbSqlString.Append("," + item.ParameterName);
                        }
                    }
                }
                result = context.Set<TEntity>().FromSqlRaw(sbSqlString.ToString(), sqlParams).AsEnumerable().FirstOrDefault();
            }
            finally
            {
                context?.Dispose();
            }
            return result;
        }

        public bool Insert(TEntity entity)
        {
            using TContext context = new();
            using var transaction = context.Database.BeginTransaction();
            bool result;
            try
            {
                var InsertState = context.Entry<TEntity>(entity);
                InsertState.State = EntityState.Added;
                int changeResult = context.SaveChanges();
                result = (changeResult > 0);
                if (result)
                {
                    transaction.Commit();
                }
            }
            catch (Exception)
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                transaction?.Dispose();
                context?.Dispose();
            }
            return result;
        }

        public bool InsertRange(List<TEntity> entity)
        {
            using TContext context = new();
            using var transaction = context.Database.BeginTransaction();
            bool result;
            try
            {
                var InsertState = context.Entry<List<TEntity>>(entity);
                InsertState.State = EntityState.Added;
                int changeResult = context.SaveChanges();
                result = (changeResult > 0);
                if (result)
                {
                    transaction.Commit();
                }
                else
                {
                    transaction.Rollback();
                }
            }
            catch (Exception)
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                transaction?.Dispose();
                context?.Dispose();
            }
            return result;
        }

        public T InsertwithReturnParam<T>(TEntity entity, string paramname) where T : struct
        {
            using TContext context = new();
            using var transaction = context.Database.BeginTransaction();
            T returnVal = default;
            try
            {
                var AddedState = context.Entry(entity);
                AddedState.State = EntityState.Added;
                int _result = context.SaveChanges();
                transaction.Commit();
                if (_result > 0)
                {
#pragma warning disable CS8605 // Unboxing a possibly null value.
                    returnVal = (T)AddedState.OriginalValues[paramname];
#pragma warning restore CS8605 // Unboxing a possibly null value.
                }
            }
            catch (Exception)
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                transaction?.Dispose();
                context?.Dispose();
            }
            return returnVal;
        }

        public bool InsertwithSql(string sqlQuery, bool isSp, params SqlParameter[] sqlParams)
        {
            bool result = false;
            using TContext context = new();
            using var transaction = context.Database.BeginTransaction();
            StringBuilder sbSqlString = new();
            try
            {
                sbSqlString.Append(sqlQuery);
                if (isSp)
                {
                    int count = 0;
                    foreach (SqlParameter item in sqlParams)
                    {
                        if (count == 0)
                        {
                            sbSqlString.Append(" " + item.ParameterName);
                        }
                        else
                        {
                            sbSqlString.Append("," + item.ParameterName);
                        }
                        count++;
                    }
                }
                int returnVal = context.Database.ExecuteSqlRaw(sqlQuery, sqlParams);
                if (returnVal > 0)
                {
                    result = true;
                    transaction.Commit();
                }
            }
            catch (Exception)
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                transaction?.Dispose();
                context?.Dispose();
            }
            return result;
        }

        public T InsertwithSqlReturnParam<T>(string sqlQuery, bool isSp, params SqlParameter[] sqlParams) where T : struct
        {
            using TContext context = new();
            using var transaction = context.Database.BeginTransaction();
            T returnVal = default;
            StringBuilder sbSqlString = new();
            try
            {
                sbSqlString.Append(sqlQuery);
                if (isSp)
                {
                    int count = 0;
                    foreach (SqlParameter item in sqlParams)
                    {
                        if (count == 0)
                        {
                            sbSqlString.Append(" " + item.ParameterName);
                            count++;
                        }
                        else
                        {
                            sbSqlString.Append("," + item.ParameterName);
                        }
                    }
                }
                var result = context.Database.ExecuteSqlRaw(sqlQuery, sqlParams);
                if (result > 0)
                {
                    transaction.Commit();
                    returnVal = (T)sqlParams.First(x => x.Direction == System.Data.ParameterDirection.Output).Value;
                }
            }
            catch (Exception)
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                transaction?.Dispose();
                context?.Dispose();
            }
            return returnVal;

        }

        public bool Update(TEntity entity)
        {
            using TContext context = new();
            using var transaction = context.Database.BeginTransaction();
            bool result;
            try
            {
                var UpdatedState = context.Entry<TEntity>(entity);
                UpdatedState.State = EntityState.Modified;
                int changeResult = context.SaveChanges();
                result = (changeResult > 0);
                if (result)
                {
                    transaction.Commit();
                }
            }
            catch (Exception)
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                context?.Dispose();
                transaction?.Dispose();
            }
            return result;
        }

        public bool UpdateParts(TEntity entity)
        {
            using TContext context = new();
            using var transaction = context.Database.BeginTransaction();
            bool result;
            try
            {
                var updated = context.Set<TEntity>().Attach(entity);
                var dbValues = updated.GetDatabaseValues();
                foreach (var item in dbValues.Properties)
                {
                    string propName = item.Name;
                    var newVal = entity?.GetType()?.GetProperty(propName)?.GetValue(entity, null);
                    var oldVal = dbValues.GetValue<object>(propName);
                    if (newVal?.ToString() != oldVal?.ToString())
                    {
                        updated.Property(propName).IsModified = true;
                    }
                }
                updated.CurrentValues.SetValues(entity);
                int changeResult = context.SaveChanges();
                result = (changeResult > 0);
                if (result)
                {
                    transaction.Commit();
                }
            }
            catch (Exception)
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                context?.Dispose();
                transaction?.Dispose();
            }
            return result;
        }

        public bool UpdateRange(List<TEntity> entity)
        {
            using TContext context = new();
            using var transaction = context.Database.BeginTransaction();
            bool result;
            try
            {
                var UpdatedState = context.Entry<List<TEntity>>(entity);
                UpdatedState.State = EntityState.Modified;
                int changeResult = context.SaveChanges();
                result = (changeResult > 0);
                if (result)
                {
                    transaction.Commit();
                }
            }
            catch (Exception)
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                context?.Dispose();
                transaction?.Dispose();
            }
            return result;
        }

        public bool UpdatewithSql(string sqlQuery, bool isSp, params SqlParameter[] sqlParams)
        {
            bool result = false;
            using TContext context = new();
            using var transaction = context.Database.BeginTransaction();
            StringBuilder sbSqlString = new();
            try
            {
                sbSqlString.Append(sqlQuery);
                if (isSp)
                {
                    int count = 0;
                    foreach (SqlParameter item in sqlParams)
                    {
                        if (count == 0)
                        {
                            sbSqlString.Append(" " + item.ParameterName);
                            count++;
                        }
                        else
                        {
                            sbSqlString.Append("," + item.ParameterName);
                        }
                    }
                }
                int returnVal = context.Database.ExecuteSqlRaw(sqlQuery, sqlParams);
                if (returnVal > 0)
                {
                    transaction.Commit();
                    result = true;
                }
            }
            catch (Exception)
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                transaction?.Dispose();
                context?.Dispose();
            }
            return result;
        }
    }
}
