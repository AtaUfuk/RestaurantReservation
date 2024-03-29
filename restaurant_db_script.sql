USE [master]
GO
/****** Object:  Database [RestaurantDb]    Script Date: 19.12.2023 18:31:09 ******/
CREATE DATABASE [RestaurantDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RestaurantDb', FILENAME = N'C:\Users\Vegeta\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\sqlexpress\RestaurantDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RestaurantDb_log', FILENAME = N'C:\Users\Vegeta\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\sqlexpress\RestaurantDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RestaurantDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestaurantDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestaurantDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestaurantDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestaurantDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestaurantDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestaurantDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestaurantDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RestaurantDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestaurantDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestaurantDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestaurantDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestaurantDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestaurantDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestaurantDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestaurantDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestaurantDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RestaurantDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestaurantDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestaurantDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestaurantDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestaurantDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestaurantDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [RestaurantDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestaurantDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RestaurantDb] SET  MULTI_USER 
GO
ALTER DATABASE [RestaurantDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestaurantDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestaurantDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RestaurantDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RestaurantDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RestaurantDb] SET QUERY_STORE = OFF
GO
USE [RestaurantDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19.12.2023 18:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 19.12.2023 18:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Severity] [int] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[Layer] [int] NOT NULL,
	[MethodName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 19.12.2023 18:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](255) NOT NULL,
	[ReservationDate] [datetime] NOT NULL,
	[NumberOfGuests] [int] NOT NULL,
	[TableNumber] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CustomerEmail] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tables]    Script Date: 19.12.2023 18:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tables](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
 CONSTRAINT [PK_Tables] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231217150931_Create_Db', N'7.0.14')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231217202902_New_Field_In_Log', N'7.0.14')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231218132110_change-column-type', N'7.0.14')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231219104632_added_new_column_Reservation', N'7.0.14')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231219104809_change_column_in_Reservation', N'7.0.14')
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (1, 1, N'Rezervasyon güncelleme işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,ReservationDate:12.08.1984 00:00:00,NumberOfGuests:12,TableNumber:0,IsActive:False]', CAST(N'2023-12-18T15:22:07.4600000' AS DateTime2), 1, N'ReservationManager.UpdateReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (2, 1, N'Rezervasyon ekleme işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:aa,ReservationDate:12.10.1942 00:00:00,NumberOfGuests:12,TableNumber:0,IsActive:False]', CAST(N'2023-12-18T15:23:11.5066667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (3, 1, N'Rezervasyon ekleme işlemi tamamlanmıştır.İşlem sonucu:Başarılı.', CAST(N'2023-12-18T15:23:11.6700000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (4, 3, N'System.InvalidCastException: The SqlParameterCollection only accepts non-null Microsoft.Data.SqlClient.SqlParameter type objects, not System.Data.SqlClient.SqlParameter objects.
   at Microsoft.Data.SqlClient.SqlParameterCollection.ValidateType(Object value)
   at Microsoft.Data.SqlClient.SqlParameterCollection.Add(Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.RawRelationalParameter.AddDbParameter(DbCommand command, Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.CompositeRelationalParameter.AddDbParameter(DbCommand command, Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.RelationalParameterBase.AddDbParameter(DbCommand command, IReadOnlyDictionary`2 parameterValues)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.CreateDbCommand(RelationalCommandParameterObject parameterObject, Guid commandId, DbCommandMethod commandMethod)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, Boolean isSp, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 269
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Business\Managers\TablesManager.cs:line 92', CAST(N'2023-12-18T15:30:55.1233333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (5, 3, N'Microsoft.Data.SqlClient.SqlException (0x80131904): Incorrect syntax near ''r''.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, Boolean isSp, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 269
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Business\Managers\TablesManager.cs:line 92
ClientConnectionId:f1ad9ca1-ad95-4a89-9c74-20da99bad03c
Error Number:102,State:1,Class:15', CAST(N'2023-12-18T15:34:58.9866667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (6, 3, N'System.InvalidCastException: The SqlParameterCollection only accepts non-null Microsoft.Data.SqlClient.SqlParameter type objects, not System.Data.SqlClient.SqlParameter objects.
   at Microsoft.Data.SqlClient.SqlParameterCollection.ValidateType(Object value)
   at Microsoft.Data.SqlClient.SqlParameterCollection.Add(Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.RawRelationalParameter.AddDbParameter(DbCommand command, Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.CompositeRelationalParameter.AddDbParameter(DbCommand command, Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.RelationalParameterBase.AddDbParameter(DbCommand command, IReadOnlyDictionary`2 parameterValues)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.CreateDbCommand(RelationalCommandParameterObject parameterObject, Guid commandId, DbCommandMethod commandMethod)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, Boolean isSp, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 269
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Business\Managers\TablesManager.cs:line 92', CAST(N'2023-12-18T15:37:18.6933333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (7, 3, N'System.InvalidCastException: The SqlParameterCollection only accepts non-null Microsoft.Data.SqlClient.SqlParameter type objects, not System.Data.SqlClient.SqlParameter objects.
   at Microsoft.Data.SqlClient.SqlParameterCollection.ValidateType(Object value)
   at Microsoft.Data.SqlClient.SqlParameterCollection.Add(Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.RawRelationalParameter.AddDbParameter(DbCommand command, Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.CompositeRelationalParameter.AddDbParameter(DbCommand command, Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.RelationalParameterBase.AddDbParameter(DbCommand command, IReadOnlyDictionary`2 parameterValues)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.CreateDbCommand(RelationalCommandParameterObject parameterObject, Guid commandId, DbCommandMethod commandMethod)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, Boolean isSp, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 269
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Business\Managers\TablesManager.cs:line 92', CAST(N'2023-12-18T15:38:34.4700000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (8, 3, N'System.InvalidCastException: The SqlParameterCollection only accepts non-null Microsoft.Data.SqlClient.SqlParameter type objects, not System.Data.SqlClient.SqlParameter objects.
   at Microsoft.Data.SqlClient.SqlParameterCollection.ValidateType(Object value)
   at Microsoft.Data.SqlClient.SqlParameterCollection.Add(Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.RawRelationalParameter.AddDbParameter(DbCommand command, Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.CompositeRelationalParameter.AddDbParameter(DbCommand command, Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.RelationalParameterBase.AddDbParameter(DbCommand command, IReadOnlyDictionary`2 parameterValues)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.CreateDbCommand(RelationalCommandParameterObject parameterObject, Guid commandId, DbCommandMethod commandMethod)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, Boolean isSp, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 269
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Business\Managers\TablesManager.cs:line 92', CAST(N'2023-12-18T15:47:16.2366667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (9, 3, N'System.InvalidCastException: The SqlParameterCollection only accepts non-null Microsoft.Data.SqlClient.SqlParameter type objects, not System.Data.SqlClient.SqlParameter objects.
   at Microsoft.Data.SqlClient.SqlParameterCollection.ValidateType(Object value)
   at Microsoft.Data.SqlClient.SqlParameterCollection.Add(Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.RawRelationalParameter.AddDbParameter(DbCommand command, Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.CompositeRelationalParameter.AddDbParameter(DbCommand command, Object value)
   at Microsoft.EntityFrameworkCore.Storage.Internal.RelationalParameterBase.AddDbParameter(DbCommand command, IReadOnlyDictionary`2 parameterValues)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.CreateDbCommand(RelationalCommandParameterObject parameterObject, Guid commandId, DbCommandMethod commandMethod)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, Boolean isSp, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 269
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Business\Managers\TablesManager.cs:line 92', CAST(N'2023-12-18T15:48:24.8566667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (10, 3, N'Microsoft.Data.SqlClient.SqlException (0x80131904): Error converting data type nvarchar to datetime.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, Boolean isSp, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 269
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Business\Managers\TablesManager.cs:line 92
ClientConnectionId:fad55bdc-6bd3-479a-92bf-7961781f629c
Error Number:8114,State:5,Class:16', CAST(N'2023-12-18T16:11:29.4666667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (11, 3, N'Microsoft.Data.SqlClient.SqlException (0x80131904): Error converting data type nvarchar to datetime.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, Boolean isSp, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 269
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Business\Managers\TablesManager.cs:line 92
ClientConnectionId:24e6da9f-d442-467e-bfa1-051793ae9387
Error Number:8114,State:5,Class:16', CAST(N'2023-12-18T16:13:49.1666667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (12, 3, N'Microsoft.Data.SqlClient.SqlException (0x80131904): Error converting data type nvarchar to datetime.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, Boolean isSp, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 269
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests)
ClientConnectionId:24e6da9f-d442-467e-bfa1-051793ae9387
Error Number:8114,State:5,Class:16', CAST(N'2023-12-18T16:19:08.3633333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (13, 3, N'Microsoft.Data.SqlClient.SqlException (0x80131904): Error converting data type nvarchar to datetime.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 267
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Business\Managers\TablesManager.cs:line 92
ClientConnectionId:7c3ad711-6ed7-47a1-a16b-e012745833ae
Error Number:8114,State:5,Class:16', CAST(N'2023-12-18T16:45:04.7600000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (14, 3, N'Microsoft.Data.SqlClient.SqlException (0x80131904): Error converting data type nvarchar to datetime.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 267
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Business\Managers\TablesManager.cs:line 92
ClientConnectionId:7c3ad711-6ed7-47a1-a16b-e012745833ae
Error Number:8114,State:5,Class:16', CAST(N'2023-12-18T16:45:13.6933333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (15, 3, N'System.Data.SqlTypes.SqlTypeException: SqlDateTime overflow. Must be between 1/1/1753 12:00:00 AM and 12/31/9999 11:59:59 PM.
   at System.Data.SqlTypes.SqlDateTime.FromTimeSpan(TimeSpan value)
   at System.Data.SqlTypes.SqlDateTime.FromDateTime(DateTime value)
   at System.Data.SqlTypes.SqlDateTime..ctor(DateTime value)
   at Microsoft.Data.SqlClient.MetaType.FromDateTime(DateTime dateTime, Byte cb)
   at Microsoft.Data.SqlClient.TdsParser.WriteUnterminatedValue(Object value, MetaType type, Byte scale, Int32 actualLength, Int32 encodingByteSize, Int32 offset, TdsParserStateObject stateObj, Int32 paramSize, Boolean isDataFeed)
   at Microsoft.Data.SqlClient.TdsParser.WriteValue(Object value, MetaType type, Byte scale, Int32 actualLength, Int32 encodingByteSize, Int32 offset, TdsParserStateObject stateObj, Int32 paramSize, Boolean isDataFeed)
   at Microsoft.Data.SqlClient.TdsParser.TDSExecuteRPCAddParameter(TdsParserStateObject stateObj, SqlParameter param, MetaType mt, Byte options, SqlCommand command, Boolean isAnonymous)
   at Microsoft.Data.SqlClient.TdsParser.TdsExecuteRPC(SqlCommand cmd, _SqlRPC[] rpcArray, Int32 timeout, Boolean inSchema, SqlNotificationRequest notificationRequest, TdsParserStateObject stateObj, Boolean isCommandProc, Boolean sync, TaskCompletionSource`1 completion, Int32 startRpc, Int32 startParam)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 267
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Business\Managers\TablesManager.cs:line 92', CAST(N'2023-12-18T16:48:38.9700000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (16, 3, N'Microsoft.Data.SqlClient.SqlException (0x80131904): Error converting data type nvarchar to datetime.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 267
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests)
ClientConnectionId:bb4ae501-6b84-4c6b-bab1-636961a97fac
Error Number:8114,State:5,Class:16', CAST(N'2023-12-18T16:49:36.0600000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (17, 3, N'Microsoft.Data.SqlClient.SqlException (0x80131904): Error converting data type nvarchar to datetime.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 267
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests)
ClientConnectionId:bb4ae501-6b84-4c6b-bab1-636961a97fac
Error Number:8114,State:5,Class:16', CAST(N'2023-12-18T16:50:25.2100000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (18, 3, N'Microsoft.Data.SqlClient.SqlException (0x80131904): Error converting data type nvarchar to datetime.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.InitializeReader(Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.<>c.<MoveNext>b__21_0(DbContext _, Enumerator enumerator)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.FromSqlQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at RestaurantReservation.Core.DataAccess.EntityFramework.EFRepositoryBase`2.GetListwithSql(String sqlQuery, SqlParameter[] sqlParams) in E:\Calismalar\OrnCalismalar\CoreOrnCalismalar\RestaurantReservation\RestaurantReservation.Core\DataAccess\EntityFramework\EFRepositoryBase.cs:line 267
   at RestaurantReservation.Business.Managers.TablesManager.GetAvaibles(DateTime date, Int32 guests)
ClientConnectionId:bb4ae501-6b84-4c6b-bab1-636961a97fac
Error Number:8114,State:5,Class:16', CAST(N'2023-12-18T16:51:11.1300000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (19, 1, N'Rezervasyon ekleme işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:asdasd,ReservationDate:12.12.2022 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T00:34:20.2000000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (20, 1, N'Rezervasyon ekleme işlemi tamamlanmıştır.İşlem sonucu:Başarılı.', CAST(N'2023-12-19T00:34:20.2800000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (21, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@aa.com,CustomerName:123231,ReservationDate:12.12.2022 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T02:17:43.3400000' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (22, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@aa.com,CustomerName:123231,ReservationDate:12.12.2022 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T02:18:32.4133333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (23, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:12.12.2022 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T02:18:33.8500000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (24, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T02:18:34.2800000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (25, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:12.12.2022 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T02:22:48.1533333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (26, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:12.12.2022 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T02:22:50.9266667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (27, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T02:22:51.2933333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (28, 1, N'Rezervasyon ekleme işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,ReservationDate:12.12.2022 00:00:00,NumberOfGuests:2,TableNumber:2,IsActive:False]', CAST(N'2023-12-19T02:22:55.8333333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (29, 1, N'Rezervasyon kaydı başarılı bir şekilde tamamlanmıştır.', CAST(N'2023-12-19T02:22:55.8666667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (30, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:12.12.2022 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T02:39:27.9333333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (31, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:12.12.2022 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T02:39:27.9400000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (32, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T02:39:27.9500000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (33, 1, N'Rezervasyon ekleme işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,ReservationDate:12.12.2022 00:00:00,NumberOfGuests:2,TableNumber:3,IsActive:False]', CAST(N'2023-12-19T02:39:27.9533333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (34, 1, N'Rezervasyon kaydı başarılı bir şekilde tamamlanmıştır.', CAST(N'2023-12-19T02:39:27.9600000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (35, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:12.12.2022 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T02:41:45.1466667' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (36, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:12.12.2022 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T02:41:45.1933333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (37, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T02:41:45.2333333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (38, 1, N'Rezervasyon ekleme işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,ReservationDate:12.12.2022 00:00:00,NumberOfGuests:2,TableNumber:6,IsActive:False]', CAST(N'2023-12-19T02:41:45.2500000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (39, 1, N'Rezervasyon kaydı başarılı bir şekilde tamamlanmıştır.', CAST(N'2023-12-19T02:41:45.2966667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (40, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@aa.com,CustomerName:asdasd,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T10:02:37.3200000' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (41, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:19.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T10:02:37.4300000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (42, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T10:02:37.9533333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (43, 1, N'Rezervasyon ekleme işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:asdasd,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T10:02:37.9600000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (44, 1, N'Rezervasyon kaydı başarılı bir şekilde tamamlanmıştır.', CAST(N'2023-12-19T10:02:37.9966667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (45, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk ATa,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T10:52:51.0433333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (46, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:19.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T10:52:51.1266667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (47, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T10:52:51.4233333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (48, 1, N'Rezervasyon ekleme işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk ATa,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,TableNumber:2,IsActive:False]', CAST(N'2023-12-19T10:52:51.4300000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (49, 1, N'Rezervasyon kaydı başarılı bir şekilde tamamlanmıştır.', CAST(N'2023-12-19T10:52:51.5566667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (50, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T11:02:22.4966667' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (51, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:19.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T11:02:22.5866667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (52, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T11:02:22.8166667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (53, 1, N'Rezervasyon ekleme işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,TableNumber:3,IsActive:False]', CAST(N'2023-12-19T11:02:22.8233333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (54, 1, N'Rezervasyon kaydı başarılı bir şekilde tamamlanmıştır.', CAST(N'2023-12-19T11:02:22.8500000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (55, 1, N'Rezervasyon bilgilerini getirme işlemi ekli parametre ile başlamıştır.id:[7]', CAST(N'2023-12-19T11:03:54.4933333' AS DateTime2), 1, N'ReservationManager.GetReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (56, 1, N'Rezervasyon güncelleme işlemi ekli parametreler ile başlamıştır.Model:[Id:7,CustomerName:Ufuk Ata,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,TableNumber:3,IsActive:True]', CAST(N'2023-12-19T11:03:54.8266667' AS DateTime2), 1, N'ReservationManager.UpdateReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (57, 1, N'Rezervasyon işlemi başarıyla tamamlanmıştır.', CAST(N'2023-12-19T11:03:54.8900000' AS DateTime2), 1, N'ReservationManager.UpdateReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (58, 1, N'Rezervasyon bilgilerini getirme işlemi ekli parametre ile başlamıştır.id:[7]', CAST(N'2023-12-19T11:03:56.1733333' AS DateTime2), 1, N'ReservationManager.GetReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (59, 1, N'Rezervasyon güncelleme işlemi ekli parametreler ile başlamıştır.Model:[Id:7,CustomerName:Ufuk Ata,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,TableNumber:3,IsActive:True]', CAST(N'2023-12-19T11:03:56.1800000' AS DateTime2), 1, N'ReservationManager.UpdateReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (60, 1, N'Rezervasyonun tamamlanması esnasında bir sorun ile karşılaşıldı, lütfen daha sonra tekrardan deneyiniz.', CAST(N'2023-12-19T11:03:56.1866667' AS DateTime2), 1, N'ReservationManager.UpdateReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (61, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:5.12.2023 00:00:00,NumberOfGuests:4,ResultMessage:,Result:False]', CAST(N'2023-12-19T12:58:27.1266667' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (62, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:5.12.2023 00:00:00,Misafir Sayısı:4', CAST(N'2023-12-19T12:58:27.2100000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (63, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T12:58:27.6300000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (64, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,ReservationDate:5.12.2023 00:00:00,NumberOfGuests:4,TableNumber:3,IsActive:False]', CAST(N'2023-12-19T12:58:27.6366667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (65, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T12:58:27.6400000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (66, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:28:07.5000000' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (67, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:12.12.2023 00:00:00,Misafir Sayısı:4', CAST(N'2023-12-19T13:28:07.5900000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (68, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:28:08.0200000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (69, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,CustomerEmail:,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,TableNumber:3,IsActive:False]', CAST(N'2023-12-19T13:28:08.0300000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (70, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:28:08.0333333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (71, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:28:24.0933333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (72, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:12.12.2023 00:00:00,Misafir Sayısı:4', CAST(N'2023-12-19T13:28:24.0966667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (73, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:28:24.1066667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (74, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,CustomerEmail:,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,TableNumber:3,IsActive:False]', CAST(N'2023-12-19T13:28:24.1100000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (75, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:28:24.1133333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (76, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:28:37.5533333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (77, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:12.12.2023 00:00:00,Misafir Sayısı:4', CAST(N'2023-12-19T13:28:37.5600000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (78, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:28:37.5666667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (79, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,CustomerEmail:,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,TableNumber:3,IsActive:False]', CAST(N'2023-12-19T13:28:37.5700000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (80, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:28:37.5700000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (81, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:29:22.8266667' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (82, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:12.12.2023 00:00:00,Misafir Sayısı:4', CAST(N'2023-12-19T13:29:22.8333333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (83, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:29:22.8400000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (84, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,CustomerEmail:,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,TableNumber:3,IsActive:False]', CAST(N'2023-12-19T13:29:22.8433333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (85, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:29:22.8466667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (86, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:30:18.1300000' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (87, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:12.12.2023 00:00:00,Misafir Sayısı:4', CAST(N'2023-12-19T13:30:18.1333333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (88, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:30:18.1433333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (89, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,CustomerEmail:,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,TableNumber:3,IsActive:False]', CAST(N'2023-12-19T13:30:18.1500000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (90, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:30:18.1533333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (91, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:31:12.5533333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (92, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:12.12.2023 00:00:00,Misafir Sayısı:4', CAST(N'2023-12-19T13:31:12.5600000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (93, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:31:12.5733333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (94, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,CustomerEmail:,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,TableNumber:3,IsActive:False]', CAST(N'2023-12-19T13:31:12.5766667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (95, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:31:12.5800000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (96, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:31:15.2300000' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (97, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:12.12.2023 00:00:00,Misafir Sayısı:4', CAST(N'2023-12-19T13:31:15.2333333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (98, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:31:15.2433333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (99, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,CustomerEmail:,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,TableNumber:3,IsActive:False]', CAST(N'2023-12-19T13:31:15.2466667' AS DateTime2), 1, N'ReservationManager.AddReservation')
GO
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (100, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:31:15.2500000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (101, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:31:22.4700000' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (102, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:12.12.2023 00:00:00,Misafir Sayısı:4', CAST(N'2023-12-19T13:31:22.4766667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (103, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:31:22.4833333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (104, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk Ata,CustomerEmail:,ReservationDate:12.12.2023 00:00:00,NumberOfGuests:4,TableNumber:3,IsActive:False]', CAST(N'2023-12-19T13:31:22.4866667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (105, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:31:22.4900000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (106, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@aa.com,CustomerName:asdasd,ReservationDate:4.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:31:32.9533333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (107, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:4.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:31:32.9600000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (108, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:31:32.9666667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (109, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:asdasd,CustomerEmail:,ReservationDate:4.12.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T13:31:32.9700000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (110, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:31:32.9733333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (111, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@aa.com,CustomerName:asdasd,ReservationDate:4.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:32:20.2066667' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (112, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:4.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:32:20.2133333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (113, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:32:20.2233333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (114, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:asdasd,CustomerEmail:,ReservationDate:4.12.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T13:32:20.2300000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (115, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:32:20.2333333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (116, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@aa.com,CustomerName:Ufuk ATa,ReservationDate:29.11.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:32:36.6966667' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (117, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:29.11.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:32:36.7000000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (118, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:32:36.7100000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (119, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk ATa,CustomerEmail:,ReservationDate:29.11.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T13:32:36.7133333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (120, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:32:36.7166667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (121, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@aa.com,CustomerName:Ufuk ATa,ReservationDate:29.11.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:33:16.5200000' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (122, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:29.11.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:33:16.5233333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (123, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:33:16.5300000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (124, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk ATa,CustomerEmail:,ReservationDate:29.11.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T13:33:16.5333333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (125, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:33:16.5366667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (126, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@a.com,CustomerName:asdsa,ReservationDate:11.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:33:30.6166667' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (127, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:11.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:33:30.6200000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (128, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:33:30.6266667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (129, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:asdsa,CustomerEmail:,ReservationDate:11.12.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T13:33:30.6300000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (130, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:33:30.6333333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (131, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@a.com,CustomerName:asdsa,ReservationDate:11.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:34:23.6366667' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (132, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:11.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:34:23.6400000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (133, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:34:23.6500000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (134, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:asdsa,CustomerEmail:,ReservationDate:11.12.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T13:34:23.6533333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (135, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:34:23.6533333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (136, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@aa.com,CustomerName:Ufuk,ReservationDate:4.12.2023 00:00:00,NumberOfGuests:1,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:38:06.2833333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (137, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:4.12.2023 00:00:00,Misafir Sayısı:1', CAST(N'2023-12-19T13:38:06.3733333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (138, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:38:06.6333333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (139, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk,CustomerEmail:,ReservationDate:4.12.2023 00:00:00,NumberOfGuests:1,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T13:38:06.6400000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (140, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.Rezervasyon için verilen kişi sayısı en az 2, en fazla 12 olmalıdır.', CAST(N'2023-12-19T13:38:06.6433333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (141, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@aa.com,CustomerName:Ufuk,ReservationDate:4.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T13:38:18.4433333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (142, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:4.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:38:18.4500000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (143, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:38:18.4600000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (144, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk,CustomerEmail:,ReservationDate:4.12.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T13:38:18.4633333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (145, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T13:38:18.4666667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (146, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:]', CAST(N'2023-12-19T13:50:17.2733333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (147, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:19.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:50:17.3666667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (148, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:50:17.6300000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (149, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:]', CAST(N'2023-12-19T13:51:47.9266667' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (150, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:19.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:51:47.9333333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (151, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:51:47.9466667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (152, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk ATa,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:]', CAST(N'2023-12-19T13:52:05.1100000' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (153, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:19.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:52:05.1133333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (154, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:52:05.1200000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (155, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk ATa,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:]', CAST(N'2023-12-19T13:52:52.6133333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (156, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:19.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:52:52.6166667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (157, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:52:52.6233333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (158, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:]', CAST(N'2023-12-19T13:53:21.1733333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (159, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:19.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:53:21.2500000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (160, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:53:21.4866667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (161, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:]', CAST(N'2023-12-19T13:53:54.3700000' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (162, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:19.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:53:54.3800000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (163, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:53:54.3933333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (164, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:]', CAST(N'2023-12-19T13:54:13.8033333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (165, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:19.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:54:13.8133333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (166, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:54:13.8166667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (167, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:]', CAST(N'2023-12-19T13:54:27.5900000' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (168, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:19.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:54:29.3000000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (169, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T13:54:29.3100000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (170, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:19.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:54:43.4833333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (171, 1, N'Üzgünüz, istenilen kriterlerde herhangi bir kayıt bulunamamıştır.', CAST(N'2023-12-19T13:57:07.2266667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (172, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk Ata,ReservationDate:19.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:]', CAST(N'2023-12-19T13:58:04.0133333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (173, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:19.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T13:58:04.0166667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (174, 1, N'Üzgünüz, talepleriniz doğrultusunda uygun bir masa bulunamamıştır, lütfen ileriki bir tarih için tekrardan deneyiniz.', CAST(N'2023-12-19T13:58:04.0233333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (175, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@aa.com,CustomerName:Ufuk ATa,ReservationDate:11.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T14:39:28.7033333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (176, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:11.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T14:39:31.0100000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (177, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T14:39:31.4433333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (178, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk ATa,CustomerEmail:a@aa.com,ReservationDate:11.12.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T14:39:44.2433333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (179, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T14:39:44.2500000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (180, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@aa.com,CustomerName:Ufuk ATa,ReservationDate:11.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T14:41:41.0733333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (181, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:11.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T14:41:41.0800000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (182, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T14:41:41.0900000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (183, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk ATa,CustomerEmail:a@aa.com,ReservationDate:11.12.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T14:41:41.0933333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (184, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T14:41:41.0966667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (185, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:a@aa.com,CustomerName:Ufuk ATa,ReservationDate:11.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T14:43:14.2266667' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (186, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:11.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T14:43:14.2300000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (187, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T14:43:14.2533333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (188, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk ATa,CustomerEmail:a@aa.com,ReservationDate:11.12.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T14:43:14.2600000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (189, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T14:43:14.2600000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (190, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk ATa,ReservationDate:23.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T14:43:35.6900000' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (191, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:23.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T14:43:36.9166667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (192, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T14:43:36.9300000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (193, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk ATa,CustomerEmail:ufukata34@gmail.com,ReservationDate:23.12.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T14:43:41.4466667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (194, 1, N'Rezervasyon kaydı başarılı bir şekilde tamamlanmıştır ve belirttiğiniz mail adresine onay maili gelmiştir.Bu mail içerisindeki linki tıklayarak rezervasyon işlemini tamamlanmış olacaktır.', CAST(N'2023-12-19T14:44:06.6800000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (195, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk ATa,ReservationDate:23.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T14:45:46.4333333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (196, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:23.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T14:45:47.8733333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (197, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T14:45:47.8833333' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (198, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk ATa,CustomerEmail:ufukata34@gmail.com,ReservationDate:23.12.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T14:45:50.0600000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (199, 1, N'Rezervasyon kaydı başarılı bir şekilde tamamlanmıştır ve belirttiğiniz mail adresine onay maili gelmiştir.Bu mail içerisindeki linki tıklayarak rezervasyon işlemini tamamlanmış olacaktır.', CAST(N'2023-12-19T14:46:30.6033333' AS DateTime2), 1, N'ReservationManager.AddReservation')
GO
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (200, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk ATa,ReservationDate:23.12.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T14:47:05.0933333' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (201, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:23.12.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T14:47:05.1000000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (202, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T14:47:05.1100000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (203, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk ATa,CustomerEmail:ufukata34@gmail.com,ReservationDate:23.12.2023 00:00:00,NumberOfGuests:2,TableNumber:2,IsActive:False]', CAST(N'2023-12-19T14:47:05.1166667' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (204, 1, N'Rezervasyon kaydı başarılı bir şekilde tamamlanmıştır ve belirttiğiniz mail adresine onay maili gönderilmiştir.Bu mail içerisindeki linki tıklayarak rezervasyon işlemini tamamlanmış olacaktır.', CAST(N'2023-12-19T14:47:07.9533333' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (205, 1, N'Rezervasyon işlemi ekli parametreler ile başlamıştır.Model:[Email:ufukata34@gmail.com,CustomerName:Ufuk ATa,ReservationDate:27.11.2023 00:00:00,NumberOfGuests:2,ResultMessage:,Result:False]', CAST(N'2023-12-19T14:47:18.9300000' AS DateTime2), 2, N'ReservationController.Index(POST)')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (206, 1, N'Uygun masa bilgilerinin getirilme işlemi ekli parametreler ile başlamıştır.Tarih:27.11.2023 00:00:00,Misafir Sayısı:2', CAST(N'2023-12-19T14:47:19.4200000' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (207, 1, N'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.', CAST(N'2023-12-19T14:47:19.4266667' AS DateTime2), 1, N'TablesManager.GetAvaibles')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (208, 1, N'Rezervasyon oluşturma işlemi ekli parametreler ile başlamıştır.Model:[Id:0,CustomerName:Ufuk ATa,CustomerEmail:ufukata34@gmail.com,ReservationDate:27.11.2023 00:00:00,NumberOfGuests:2,TableNumber:1,IsActive:False]', CAST(N'2023-12-19T14:47:20.4800000' AS DateTime2), 1, N'ReservationManager.AddReservation')
INSERT [dbo].[Log] ([Id], [Severity], [Message], [CreatedDate], [Layer], [MethodName]) VALUES (209, 1, N'Rezervasyon tarihi en erken bugün ve daha sonraki günler için yapılabilmektedir.', CAST(N'2023-12-19T14:47:20.4833333' AS DateTime2), 1, N'ReservationManager.AddReservation')
SET IDENTITY_INSERT [dbo].[Log] OFF
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([Id], [CustomerName], [ReservationDate], [NumberOfGuests], [TableNumber], [IsActive], [CustomerEmail]) VALUES (1, N'asdasd', CAST(N'2022-12-12T00:00:00.000' AS DateTime), 2, 1, 0, N'')
INSERT [dbo].[Reservation] ([Id], [CustomerName], [ReservationDate], [NumberOfGuests], [TableNumber], [IsActive], [CustomerEmail]) VALUES (2, N'Ufuk Ata', CAST(N'2022-12-12T00:00:00.000' AS DateTime), 2, 2, 0, N'')
INSERT [dbo].[Reservation] ([Id], [CustomerName], [ReservationDate], [NumberOfGuests], [TableNumber], [IsActive], [CustomerEmail]) VALUES (3, N'Ufuk Ata', CAST(N'2022-12-12T00:00:00.000' AS DateTime), 2, 3, 0, N'')
INSERT [dbo].[Reservation] ([Id], [CustomerName], [ReservationDate], [NumberOfGuests], [TableNumber], [IsActive], [CustomerEmail]) VALUES (4, N'Ufuk Ata', CAST(N'2022-12-12T00:00:00.000' AS DateTime), 2, 6, 0, N'')
INSERT [dbo].[Reservation] ([Id], [CustomerName], [ReservationDate], [NumberOfGuests], [TableNumber], [IsActive], [CustomerEmail]) VALUES (5, N'asdasd', CAST(N'2023-12-19T00:00:00.000' AS DateTime), 2, 1, 0, N'')
INSERT [dbo].[Reservation] ([Id], [CustomerName], [ReservationDate], [NumberOfGuests], [TableNumber], [IsActive], [CustomerEmail]) VALUES (6, N'Ufuk ATa', CAST(N'2023-12-19T00:00:00.000' AS DateTime), 2, 2, 0, N'')
INSERT [dbo].[Reservation] ([Id], [CustomerName], [ReservationDate], [NumberOfGuests], [TableNumber], [IsActive], [CustomerEmail]) VALUES (7, N'Ufuk Ata', CAST(N'2023-12-19T00:00:00.000' AS DateTime), 2, 3, 1, N'')
INSERT [dbo].[Reservation] ([Id], [CustomerName], [ReservationDate], [NumberOfGuests], [TableNumber], [IsActive], [CustomerEmail]) VALUES (9, N'Ufuk ATa', CAST(N'2023-12-23T00:00:00.000' AS DateTime), 2, 1, 0, N'ufukata34@gmail.com')
INSERT [dbo].[Reservation] ([Id], [CustomerName], [ReservationDate], [NumberOfGuests], [TableNumber], [IsActive], [CustomerEmail]) VALUES (10, N'Ufuk ATa', CAST(N'2023-12-23T00:00:00.000' AS DateTime), 2, 2, 0, N'ufukata34@gmail.com')
SET IDENTITY_INSERT [dbo].[Reservation] OFF
SET IDENTITY_INSERT [dbo].[Tables] ON 

INSERT [dbo].[Tables] ([Id], [Number], [Capacity]) VALUES (1, 1, 2)
INSERT [dbo].[Tables] ([Id], [Number], [Capacity]) VALUES (2, 2, 2)
INSERT [dbo].[Tables] ([Id], [Number], [Capacity]) VALUES (3, 3, 4)
INSERT [dbo].[Tables] ([Id], [Number], [Capacity]) VALUES (4, 4, 6)
INSERT [dbo].[Tables] ([Id], [Number], [Capacity]) VALUES (5, 5, 8)
INSERT [dbo].[Tables] ([Id], [Number], [Capacity]) VALUES (6, 6, 4)
INSERT [dbo].[Tables] ([Id], [Number], [Capacity]) VALUES (7, 7, 6)
INSERT [dbo].[Tables] ([Id], [Number], [Capacity]) VALUES (8, 8, 8)
SET IDENTITY_INSERT [dbo].[Tables] OFF
ALTER TABLE [dbo].[Log] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Log] ADD  DEFAULT (N'') FOR [MethodName]
GO
ALTER TABLE [dbo].[Reservation] ADD  DEFAULT (getdate()) FOR [ReservationDate]
GO
/****** Object:  StoredProcedure [dbo].[SpGetAvaibleTable]    Script Date: 19.12.2023 18:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SpGetAvaibleTable]
@Date DateTime,
@Guests int
as
begin
SELECT tbl.Id,tbl.Number,tbl.Capacity FROM [Tables] tbl left join Reservation r on tbl.Number=r.TableNumber and r.ReservationDate=@Date WHERE r.TableNumber is null and tbl.Capacity=@Guests order by tbl.Capacity
end
GO
/****** Object:  StoredProcedure [dbo].[SpGetAvaibleTables]    Script Date: 19.12.2023 18:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SpGetAvaibleTables]
@Date DateTime,
@Guests int
as
begin
SELECT tbl.Id,tbl.Number,tbl.Capacity FROM [Tables] tbl left join Reservation r on tbl.Number=r.TableNumber and r.ReservationDate=@Date WHERE r.TableNumber is null and tbl.Capacity>=@Guests order by tbl.Capacity
end
GO
USE [master]
GO
ALTER DATABASE [RestaurantDb] SET  READ_WRITE 
GO
