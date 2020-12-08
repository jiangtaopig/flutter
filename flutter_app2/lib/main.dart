import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app2/DioCreator.dart';
import 'package:flutter_app2/DioLogInterceptor.dart';
import 'package:flutter_app2/User.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;

      execute(() => print("函数作为参数"));

      Future.delayed(new Duration(seconds: 2), () {
        return "hello world ";
      }).then((value) {
        print(value);
      }).whenComplete(() => print("complete !")); // whenCoplete 一定会执行

      // getData();
      postData();
      // testGet();
    });
  }

  // 函数作为参数传递
  void execute(var callback) {
    callback();
  }

  void getData() async {
    BaseOptions options = new BaseOptions(
        baseUrl: "http://www.imooc.com/",
        connectTimeout: 20000,
        receiveTimeout: 20000);
    Dio dio = new Dio(options);

    Response response =
        await dio.get("api/teacher", queryParameters: {"type": 4, "num": 2});
    print("res : " + response.data.toString());
  }

  void postData() async {

    DioCreator dioCreator = DioCreator.instance;
    dioCreator.setPersistCookieJar();
    Dio dio = dioCreator.getDio();

    Response response = await dio.post("api/customer/v2/login",
        data: {"loginName": "13412221222", "encryptPasswd": "ac0oxQRHgloQ936h5WanRTUI8bUoeayc/kGrB9Qti/5zIqlVG2YQA3UO3/fmo5awPEPfvg0AF+1QNwSZRicB8RFMV4xCqf17N8+yRZw8Tw63+5HHyz6W0wPpwqAvLTDXU5Z3mQ7UFovtk/reZrsSKOp+id55qJFVjxp0iBAwSUs="
          , "source":"A", "deviceId":"f60a5f83-395a-4f11-aa52-6ed2a244b1f7", "sms":false});
    print("result : " + response.data.toString());

    testGet();
  }

  void testGet() async{
    DioCreator dioCreator = DioCreator.instance;
    var dio = dioCreator.getDio();
    // List<Cookie> cookies = new List();
    // cookies.add(Cookie("za_ciid", "ATqOSAAAAAAAAcsBaHR0cHM6Ly9pbWFnZS56dWlmdWxpLmNvbS8xNC8yMDE4MTEzMC85NDQzYmExNGRmZDA5OTZlZThkM"
    //     "2QyYTk4YWE4MmFhMS5qcGcAAf3LFgAAAAAAAIN+HwAAAAAAAQEAAAABZe5rgh8AAAAAAAExMzQxMjIyMTIysgEAamF2YS51dGlsLkRhdOUB6ytKPHYBAAABhO"
    //     "acseaxn+a2mwH9yxYAAAAAAAAB/csWAAAAAAAAAQIBoSYRAAAAAAABgkEBAAAAAAA="));
    // cookies.add(Cookie("za_itid", "ZuSERPHLSovGlKZxO8CtBaNS/D4r1a45c3z33paVQTn2U6CIFvO/e+xfrGQtbailiI3gWSM3W9bXmKAZUN3iYw=="));
    // cookies.add(Cookie("_orgCustId", "ZZz4Z3GkKT6UfiLUiNPOxTku3gq+4Lr5s9AzvdqzghtGSLPvXrCJMiu2ZDHH0Dh8DvmHk3imO4rgY4QzyUf7h5Q=="));
    // dioCreator.setCookies(dio.options.baseUrl, cookies);

    Response response = await dio.get("https://t-api.zuifuli.com/api/website/v2/meeting/today");

    Future.delayed(new Duration(seconds: 4), (){
      dioCreator.printCookies();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
