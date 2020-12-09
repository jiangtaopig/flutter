
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app2/pages/article_like_bar.dart';
import 'package:flutter_app2/pages/sub_test_stateful_widget.dart';
import 'package:intl/intl.dart';

class TestStatefulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    print("crate state");
    return TestState();
  }
}

class TestState extends State<TestStatefulWidget>{
  int count = 1;
  String name = "test";
  String curTimeStr;

  @override
  void initState() {
    print("init state");
    curTimeStr = _getTimeStr();
    _refreshTime();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant TestStatefulWidget oldWidget) {
    count++;
    print("didUpdateWidget $count");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  @override
  void reassemble() {
    print("reassemble");
    super.reassemble();
  }

  void changeName(){
    setState(() {
      print("set state");
      this.name = "zhujiangtao";
    });
  }

  _refreshTime(){
    const delay = Duration(seconds: 1);
    Timer.periodic(delay, (timer) {
      setState(() {
        curTimeStr = _getTimeStr();
      });
    });
  }

  String _getTimeStr(){
    DateTime now = DateTime.now();
    var formatter = DateFormat("yy-MM-dd hh:mm:ss");
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Column(
      children: <Widget>[
        FlatButton(onPressed: ()=>this.changeName(), child: Text('$name $count')),
        SubTestStatefulWidget(),
        Text('当前时间'),
        Text('$curTimeStr'),
        ArticleLikeBar(likeNum: 20)
      ],
    );
  }
  
}