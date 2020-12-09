import 'dart:io';
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_app2/DioLogInterceptor.dart';
import 'package:path_provider/path_provider.dart';

const CONNECT_TIMEOUT = 20 * 1000;
const RECEIVE_TIMEOUT = 20 * 1000;

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

  void setBaseUrl(String url) {
    if (url.isNotEmpty) _dio.options.baseUrl = url;
  }

  void setPersistCookieJar() async {
    print("setPersistCookieJar start");
    await _persistentCookie();
    print("setPersistCookieJar end");
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  Future<Map> request<T>(String url,
      {parameters,
      method,
      Function(T t) onSuccess,
      Function(String error) onError}) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';

    /// 请求处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    //请求结果
    var result;
    try {
      Response response = await _dio.request(url, data: parameters, options: new Options(method: method));
      result = response.data;
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          var data = json.encode(response.data);
          var map = json.decode(data);
          onSuccess(map);
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
    } on DioError catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }

    return result;
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

  void printCookies() {
    List<Cookie> cookies =
        _cookieJar.loadForRequest(Uri.parse(_dio.options.baseUrl));
    print("cookies >>> $cookies");
  }
}
