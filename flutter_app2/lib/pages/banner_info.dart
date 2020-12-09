import 'package:flutter/material.dart';

class BannerInfo extends StatelessWidget {
  /// 帖子标题
  final String bannerImage;

  /// 构造函数
  const BannerInfo({Key key, this.bannerImage}) : super(key: key);

  /// 左侧的标题和标题描述组件
  Widget getLeftInfo() {
    return Row(
      children: <Widget>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.network(
          bannerImage,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
