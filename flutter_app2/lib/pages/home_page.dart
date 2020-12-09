import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/pages/article_card.dart';
import 'package:flutter_app2/pages/banner_info.dart';
import 'package:flutter_app2/struct/article_summary_struct.dart';
import 'package:flutter_app2/struct/user_info_struct.dart';

class HomePage extends StatelessWidget{

  /// banner 地址信息
  final String bannerImage =
      'https://img.089t.com/content/20200227/osbbw9upeelfqnxnwt0glcht.jpg';
  /// 帖子标题
  final UserInfoStruct userInfo = UserInfoStruct(nickName: "猪头",
      avatarUrl: "https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1607485"
          "223&di=0e6c35f037e7a7fd681cbeeb99b8ac5e&src=http://b-ssl.duitang.com/uploads/item/201502/08/20150208124300_YdSks.thumb.700_0.jpeg");

  final ArticleSummaryStruct articleInfo = ArticleSummaryStruct("你好", "我是大爷",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1607495310631&di=3f841ba41ea11b170917cffff5277b70"
          "&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201412%2F17%2F20141217211542_CYRCV.jpeg", 20, 30);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          BannerInfo(bannerImage: bannerImage),
          ArticleCard(userInfo: userInfo, articleInfo: articleInfo),
        ],
      ),
    );
  }

}