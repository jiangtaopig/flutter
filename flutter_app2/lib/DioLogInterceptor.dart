import 'package:dio/dio.dart';

class DioLogInterceptor extends InterceptorsWrapper{
  @override
  Future onRequest(RequestOptions options) {
    print("api >>>  method = ${options.method.toString()}");
    print("api >>>  url = ${options.uri.toString()}");
    print("api >>>  headers = ${options.headers}");
    print("api >>>  params =  ${options.data}");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print("api >>>  statusCode : ${response?.statusCode} => url: ${response?.request?.uri.toString()} => data :${response?.data}");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError e) {
    print("api >>>  error : ${e?.response?.statusCode} => url: ${e?.request?.path}");
    return super.onError(e);
  }
}