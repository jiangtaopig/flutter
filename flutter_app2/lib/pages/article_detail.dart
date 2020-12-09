import 'package:flutter/material.dart';
import 'package:flutter_app2/pages/article_detail/article_comments.dart';
import 'package:flutter_app2/pages/article_detail/article_content.dart';
import 'package:flutter_app2/pages/article_detail/article_detail_like.dart';
import 'package:flutter_app2/struct/article_summary_struct.dart';
import 'package:flutter_app2/struct/comment_info_struct.dart';
import 'package:flutter_app2/struct/user_info_struct.dart';

class ArticleDetail extends StatelessWidget {
  final ArticleSummaryStruct articleInfo = ArticleSummaryStruct(
      '你好',
      '我是你的大爷啊',
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1607495310631&di=3f841ba41ea11b170917cffff5277b70"
          "&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201412%2F17%2F20141217211542_CYRCV.jpeg",
      20,
      30);

  /// banner 地址信息
  final List<CommentInfoStruct> commentList = [
    CommentInfoStruct(
        UserInfoStruct(
            nickName: "flutter1",
            avatarUrl:
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1607495310631&di=3f841ba41ea11b170917cffff5277b70"
                "&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201412%2F17%2F20141217211542_CYRCV.jpeg"),
        'ts1'),
    CommentInfoStruct(
        UserInfoStruct(
            nickName: "flutter2",
            avatarUrl:
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1607495310631&di=3f841ba41ea11b170917cffff5277b70"
                "&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201412%2F17%2F20141217211542_CYRCV.jpeg"),
        'ts2'),
    CommentInfoStruct(
        UserInfoStruct(
            nickName: "flutter3",
            avatarUrl:
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1607495310631&di=3f841ba41ea11b170917cffff5277b70"
                "&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201412%2F17%2F20141217211542_CYRCV.jpeg"),
        'ts3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articleInfo.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ArticleContent(content: articleInfo.summary),
            ArticleDetailLike(),
            ArticleComments(commentList: commentList),
          ],
        ),
      ),
    );
  }
}
