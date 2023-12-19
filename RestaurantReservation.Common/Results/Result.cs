namespace RestaurantReservation.Common.Utilities.Results
{
    public class Result : IResult
    {
        public Result(bool _isSuccess, string _message):this(_isSuccess)
        {
            Message = _message;
        }
        public Result(bool _isSuccess)
        {
            IsSuccess = _isSuccess;
            if(IsSuccess)
            {
                Message = StaticValues.SuccessMessage;
            }
            else
            {
                Message = StaticValues.ErrorMessage;
            }
        }
        public bool IsSuccess { get; }

        public string Message { get; }
    }
}
