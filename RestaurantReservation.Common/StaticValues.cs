namespace RestaurantReservation.Common
{
	public static class StaticValues
	{
		public const string SuccessMessage = "İşleminiz başarılı bir şekilde gerçekleştirilmiştir.";
		public const string SuccsessReservationMessage = "Rezervasyon kaydınız başarıyla tamamlanmıştır.";
		public const string ErrorMessage = "İşleminiz sırasında bir sorun ile karşılaşıldı, lütfen daha sonra tekrardan deneyiniz.";
		public const string ErrorTableNotFound = "Üzgünüz, talepleriniz doğrultusunda uygun bir masa bulunamamıştır, lütfen ileriki bir tarih için tekrardan deneyiniz.";
		public const string ErrorMessageWithExplanation= "İşleminiz sırasında bir sorun ile karşılaşıldı. Açıklaması: {0}";
		public const string EmptyModelMessage = "Üzgünüz, istenilen kriterlerde herhangi bir kayıt bulunamamıştır.";
		public const string ErrorMessageEmptyField = "{0} alanı zorunludur.";
		public const string ErrorMessageRange = "Girilen sayısal değer 1-12 arasında olmalıdır.";
		public const string ErrorMessageDate = "Tarih alanı boş bırakılamaz ve tarih formatı dd/MM/yyyy şeklinde olmalıdır.";
	}
}
