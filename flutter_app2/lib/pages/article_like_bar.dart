import 'package:flutter/material.dart';
import 'package:flutter_app2/models/like_num_model.dart';
import 'package:flutter_app2/styles/text_styles.dart';
import 'package:provider/provider.dart';

class ArticleLikeBar extends StatelessWidget {
  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    final likeNumModel = Provider.of<LikeNumModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Row(
            children: <Widget>[
              Icon(Icons.thumb_up, color: Colors.grey, size: 18),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                '${likeNumModel.value}',
                style: TextStyles.commonStyle(),
              ),
            ],
          ),
          onPressed: () => likeNumModel.like(),
        ),
      ],
    );
  }
}
