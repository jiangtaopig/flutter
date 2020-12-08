import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_app2/DioLogInterceptor.dart';
import 'package:path_provider/path_provider.dart';

final CONNECT_TIMEOUT = 20 * 1000;
final RECEIVE_TIMEOUT = 20 * 1000;

class DioCreator {
  factory DioCreator() => getInstance();
  static DioCreator get instance => getInstance();
  static DioCreator _instance;

  // 私有属性和方法前面加下划线_
  Dio _dio;
  var _cookieJar;

  Dio getDio() {
    return _dio;
  }

  DioCreator._internal() {
    _dio = Dio();
    _dio.options = getInternetOptions();
    print("------------------------");
    _cookieJar = CookieJar();
    _dio.interceptors.add(CookieManager(_cookieJar));
    _dio.interceptors.add(DioLogInterceptor());
  }

  static DioCreator getInstance() {
    if (_instance == null) {
      _instance = new DioCreator._internal();
    }
    return _instance;
  }

  void setOptions(BaseOptions options) {
    _dio.options = options;
  }

  void setCookies(String baseUrl, List<Cookie> cookies) {
    _cookieJar.saveFromResponse(Uri.parse(baseUrl), cookies);
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  void setPersistCookieJar() async {
    print("setPersistCookieJar start");
    await _persistentCookie();
    print("setPersistCookieJar end");
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  BaseOptions getInternetOptions() {
    BaseOptions options = new BaseOptions(
        baseUrl: "https://t-api.zuifuli.com/",
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT);
    return options;
  }

  _persistentCookie() async {
    print("---start----");
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    print("appDocPath .... = $appDocPath");
    _cookieJar = PersistCookieJar(dir: appDocPath);
    print("---end----");
  }

  void printCookies(){
    List<Cookie> cookies = _cookieJar.loadForRequest(Uri.parse(_dio.options.baseUrl));
    print("cookies >>> $cookies");
  }
}
