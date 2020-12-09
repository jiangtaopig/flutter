import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

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

  Future<CookieJar> persistentCookie() async {
    print("---start----");
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    print("appDocPath .... = $appDocPath");
    CookieJar cookieJar = PersistCookieJar(dir: appDocPath);
    print("---end----");
    return cookieJar;
  }

  void getPersistCookieJar() async{
    print("---getPersistCookieJar start ----");
    CookieJar cookieJar = await persistentCookie(); // 加 await 表示阻塞等待 persistentCookie()执行完，不加的话表示不等待此阻塞任务执行完
    print("---getPersistCookieJar end  cookieJar >> $cookieJar");
  }

}
