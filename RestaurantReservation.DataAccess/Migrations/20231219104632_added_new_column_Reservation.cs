using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RestaurantReservation.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class added_new_column_Reservation : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "CustomerEmail",
                table: "Reservation",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CustomerEmail",
                table: "Reservation");
        }
    }
}
