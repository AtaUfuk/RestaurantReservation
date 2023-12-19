using System.Reflection;
using System.Text;

namespace RestaurantReservation.Common.Utilities
{
	public static class ReflecUtility
	{
		/// <summary>
		/// İçinde value tipindeki değerlerli verilerin isimleri ve aldığı değerleri ile geri döndüren metoddur.
		/// </summary>
		/// <typeparam name="T">Herhangi bir referans tipindeki nesne</typeparam>
		/// <param name="obj">İlgili referans tipinin örneği</param>
		/// <returns>string</returns>
		public static string Reflect<T>(T obj)
		{
			StringBuilder result = new();
			if (obj == null) return result.ToString();

			string seperator = string.Empty;
			int counter = 0;
			Type typ = obj.GetType();
			foreach (PropertyInfo item in typ.GetProperties())
			{
				string prmName = item.Name;
				result.Append($"{seperator}{prmName}:{item.GetValue(obj, null) ?? string.Empty}");
				if (counter == 0)
				{
					seperator = ",";
					counter++;
				}
			}
			return result.ToString();
		}
	}
}
