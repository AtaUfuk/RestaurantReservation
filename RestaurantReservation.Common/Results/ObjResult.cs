namespace RestaurantReservation.Common.Utilities.Results
{
    public class ObjResult<T> : Result, IObjResult<T>
    {
        public ObjResult(bool _isSuccess, T _object) : base(_isSuccess)
        {
            Object = _object;
        }

        public ObjResult(bool _isSuccess, string _message, T _object) : base(_isSuccess, _message)
        {
            Object = _object;
        }

        public T Object { get; }
    }
}
