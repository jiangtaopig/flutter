import 'package:flutter/material.dart';

class TestFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Wrap(
        spacing: 8.0, // 水平方向上的间距
        runSpacing: 0.0, // 垂直方向上的间距
        alignment: WrapAlignment.start,
        children: [
          Chip(
            avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('A')
            ),
            label: Text('hamilton'),
          ),

          Chip(
            avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('B')
            ),
            label: Text('jordan'),
          ),

          Chip(
            avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('C')
            ),
            label: Text('careful latter'),
          ),

          Chip(
            avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('D')
            ),
            label: Text('doglas kaisi'),
          ),
        ],
      ),
    );
  }
}
