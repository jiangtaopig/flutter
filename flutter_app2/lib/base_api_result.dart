
class BaseApiResult<T> {
  int code;
  String message;
  T data;

  BaseApiResult({this.code, this.message, this.data});


}
