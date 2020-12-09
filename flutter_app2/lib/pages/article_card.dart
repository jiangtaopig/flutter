import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/pages/article_bottom_bar.dart';
import 'package:flutter_app2/pages/article_like_bar.dart';
import 'package:flutter_app2/pages/article_summary.dart';
import 'package:flutter_app2/struct/article_summary_struct.dart';
import 'package:flutter_app2/struct/user_info_struct.dart';

class ArticleCard extends StatelessWidget{
  final UserInfoStruct userInfo;
  final ArticleSummaryStruct articleInfo;

  ArticleCard({Key key, this.userInfo, this.articleInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ArticleSummaryWidget(
          title: articleInfo.title,
          summary: articleInfo.summary,
          articleImage: articleInfo.articleImage,
        ),

        Row(
          children: <Widget>[
            ArticleBottomBar(
              nickname: userInfo.nickName,
              headerImage: userInfo.avatarUrl,
              commentNum: articleInfo.commentNum,
            ),
            ArticleLikeBar(likeNum: articleInfo.likeNum),
          ],
        ),
      ],
    );
  }

}