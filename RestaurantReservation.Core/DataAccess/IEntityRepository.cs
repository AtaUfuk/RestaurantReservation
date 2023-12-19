using Microsoft.EntityFrameworkCore.Query;
using Microsoft.Data.SqlClient;
using System.Linq.Expressions;

namespace RestaurantReservation.Core.DataAccess
{
	public interface IEntityRepository<TEntity> where TEntity : class
	{
		#region Select Methods
		/// <summary>
		/// Get Entity by filters
		/// </summary>
		/// <param name="filters"></param>
		/// <returns></returns>
		public TEntity Get(Expression<Func<TEntity, bool>>? filters);
		public TEntity GetWithIncluded(Expression<Func<TEntity, bool>>? filters, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>>? orderBy, Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> include);
		public TModel GetModel<TModel>(Expression<Func<TEntity, TModel>> columns, Expression<Func<TEntity, bool>>? filters, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>>? orderBy = null) where TModel : class, new();
		public List<TEntity> GetList(Expression<Func<TEntity, bool>>? filters, Expression<Func<TEntity, object>>? orderby, bool isDesc);
		public List<TEntity> GetListSomeofThem(Expression<Func<TEntity, bool>>? filters, Expression<Func<TEntity, object>>? orderby, bool isDesc, int skip, int take);
		public List<TModel> GetModelList<TModel>(Expression<Func<TEntity, TModel>> columns, Expression<Func<TEntity, bool>>? filters, Expression<Func<TEntity, object>>? orderby, bool isDesc) where TModel : class, new();
		public List<TModel> GetModelListSomeofThem<TModel>(Expression<Func<TEntity, TModel>> columns, Expression<Func<TEntity, bool>>? filters, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>>? orderBy, int skip, int take);
		public List<TEntity> GetListWithIncluded(Expression<Func<TEntity, bool>>? filters, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>>? orderBy, Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> include);
		public List<TModel> GetModelListWithIncluded<TModel>(Expression<Func<TEntity, TModel>> columns, Expression<Func<TEntity, bool>>? filters, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>>? orderBy, Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> include);
		public List<TEntity> GetListwithSql(string sqlQuery,bool isSp, params SqlParameter[] sqlParams);
		public List<TModel> GetModelListwithSql<TModel>(string sqlQuery, bool isSp, params SqlParameter[] sqlParams) where TModel : class, new();
		public TModel GetModelWithSql<TModel>(string sqlQuery, bool isSp, params SqlParameter[] sqlParams) where TModel : class, new();
		public TEntity GetWithSql(string sqlQuery, bool isSp, params SqlParameter[] sqlParams);
		#endregion

		#region Insert Methods
		public bool Insert(TEntity entity);
		public bool InsertRange(List<TEntity> entity);
		public bool InsertwithSql(string sqlQuery, bool isSp, params SqlParameter[] sqlParams);
		T InsertwithReturnParam<T>(TEntity entity, string paramname) where T : struct;
		public T InsertwithSqlReturnParam<T>(string sqlQuery, bool isSp, params SqlParameter[] sqlParams) where T : struct;
		#endregion
		#region Update Methods
		public bool Update(TEntity entity);
		public bool UpdateParts(TEntity entity);
		public bool UpdateRange(List<TEntity> entity);
		public bool UpdatewithSql(string sqlQuery, bool isSp, params SqlParameter[] sqlParams);
		#endregion
		#region Delete Methods
		public bool Delete(TEntity entity);
		public bool DeleteRange(List<TEntity> entity);
		public bool DeletewithSql(string sqlQuery, bool isSp, params SqlParameter[] sqlParams);
		#endregion

	}
}
