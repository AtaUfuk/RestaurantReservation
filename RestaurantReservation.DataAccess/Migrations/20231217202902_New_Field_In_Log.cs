using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RestaurantReservation.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class New_Field_In_Log : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "MethodName",
                table: "Log",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "MethodName",
                table: "Log");
        }
    }
}
