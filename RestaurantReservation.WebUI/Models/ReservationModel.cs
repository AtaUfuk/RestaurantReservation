using System.ComponentModel.DataAnnotations;

namespace RestaurantReservation.WebUI.Models
{
    public class ReservationModel
    {
        [Required(ErrorMessage ="E-posta alanı zorunludur.")]
        [EmailAddress(ErrorMessage ="Lütfen geçerli bir mail adresi giriniz(Örneğin:aa@aa.com, bb@b.com vb.)")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Adınız ve Soyadınız alanı zorunludur.")]
        public string CustomerName { get; set; }
        public required DateTime ReservationDate { get; set; }
        [Range(1, 12,ConvertValueInInvariantCulture = false,ErrorMessage ="Girilen değer en az 1, en fazla 12 aralığında olmalıdır.")]
        public required int NumberOfGuests { get; set; }
        public string? ResultMessage { get; set; }
        public bool Result { get; set; }

    }
}
