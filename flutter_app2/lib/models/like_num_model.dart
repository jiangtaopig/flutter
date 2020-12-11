import 'package:flutter/material.dart';

class LikeNumModel with ChangeNotifier {
  int _likeNum = 0;

  // 设置get方法
  int get value => _likeNum;

  void like() {
    _likeNum++;
    notifyListeners();
  }
}
