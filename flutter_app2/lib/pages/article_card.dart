import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/pages/article_bottom_bar.dart';
import 'package:flutter_app2/pages/article_detail.dart';
import 'package:flutter_app2/pages/article_like_bar.dart';
import 'package:flutter_app2/pages/article_summary.dart';
import 'package:flutter_app2/struct/article_summary_struct.dart';
import 'package:flutter_app2/struct/user_info_struct.dart';

class ArticleCard extends StatelessWidget {
  /// 传入的用户信息
  final UserInfoStruct userInfo;

  /// 传入的帖子信息
  final ArticleSummaryStruct articleInfo;

  /// 构造函数
  const ArticleCard({Key key, this.userInfo, this.articleInfo})
      : super(key: key);

  /// 执行页面跳转到article_detail
  void goToArticleDetailPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ArticleDetail();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(0),
      child: FlatButton(
        color: Colors.red,
        padding: EdgeInsets.all(10),
        onPressed: () => goToArticleDetailPage(context),
        child: Column(
          children: <Widget>[
            ArticleSummaryWidget(
                title: articleInfo.title,
                summary: articleInfo.summary,
                articleImage: articleInfo.articleImage),
            Container(
              color: Colors.amber,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: ArticleBottomBar(
                        nickname: userInfo.nickName,
                        headerImage: userInfo.avatarUrl,
                        commentNum: articleInfo.commentNum),
                  ),
                  Expanded(
                    flex: 3,
                    child: ArticleLikeBar(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
