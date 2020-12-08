import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

final CONNECT_TIMEOUT = 20 * 1000;
final RECEIVE_TIMEOUT = 20 * 1000;

class User {
  static BaseOptions getInternetOptions() {
    BaseOptions options = new BaseOptions(
        baseUrl: "http://www.imooc.com/",
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT);
    return options;
  }

  static Dio getDio() {
    Dio dio = Dio();
    var options = getInternetOptions();
    options.baseUrl = "https://t-api.zuifuli.com/";
    dio.options = options;

    var cookieJar = CookieJar();
    print("Cookie >>> "+ cookieJar.loadForRequest(Uri.parse(options.baseUrl)).toString());
    dio.interceptors.add(CookieManager(cookieJar));
    return dio;
  }

  CookieJar getCookieJar(){
    return CookieJar();
  }

}
