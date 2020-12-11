import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleSummaryWidget extends StatelessWidget {
  /// 帖子标题
  final String title;

  /// 帖子概要描述信息
  final String summary;

  /// 帖子中的图片信息
  final String articleImage;

  /// 构造函数
  const ArticleSummaryWidget(
      {Key key, this.title, this.summary, this.articleImage})
      : super(key: key);

  /// 左侧的标题和标题描述组件
  Widget getLeftInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[Text(title), Text(summary)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getLeftInfo(),
          Image.network(articleImage, width: 80, height: 80, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
