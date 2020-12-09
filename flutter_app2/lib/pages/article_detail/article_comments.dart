import 'package:flutter/material.dart';
import 'package:flutter_app2/struct/comment_info_struct.dart';
import 'package:flutter_app2/styles/text_styles.dart';

class ArticleComments extends StatelessWidget {
  final List<CommentInfoStruct> commentList;

  ArticleComments({Key key, this.commentList}) : super(key: key);

  Widget getItem(CommentInfoStruct commentItem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.network(
              commentItem.userInfo.avatarUrl,
              width: 50,
              height: 50,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(commentItem.userInfo.nickName,
                  style: TextStyles.commonStyle()),
              Text(commentItem.comment, style: TextStyles.commonStyle(0.8)),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int position) {
        return getItem(this.commentList[position]);
      },
      scrollDirection: Axis.vertical,
      itemCount: this.commentList.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return Divider(height: 5, color: Colors.amber);
      },
    );
  }
}
