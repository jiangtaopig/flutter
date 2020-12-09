import 'package:flutter/material.dart';

class ArticleLikeBar extends StatefulWidget {
  /// 外部传入参数
  final int likeNum;

  ArticleLikeBar({Key key, this.likeNum}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ArticleLikeBarState();
}

class ArticleLikeBarState extends State<ArticleLikeBar> {
  int likeNum;

  @override
  void initState() {
    super.initState();
    likeNum ??= widget.likeNum;
  }

  void like() {
    setState(() {
      likeNum++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 10)),
        Icon(Icons.thumb_up, color: Colors.grey, size: 18),
        Padding(padding: EdgeInsets.only(left: 1)),
        FlatButton(onPressed: () => like(), child: Text('$likeNum')),
      ],
    );
  }
}
