import 'package:flutter/material.dart';
import 'package:flutter_app2/models/like_num_model.dart';
import 'package:flutter_app2/styles/text_styles.dart';
import 'package:provider/provider.dart';

class ArticleDetailLike extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    final likeNumModel = Provider.of<LikeNumModel>(context);

    return Column(
      children: <Widget>[
        FlatButton(onPressed: () => likeNumModel.like(), child: Icon(Icons.thumb_up, color: Colors.grey, size: 40,)),
        Text('${likeNumModel.value}', style: TextStyles.commonStyle()),
      ],
    );

  }

}