import 'package:flutter/material.dart';

class SubTestStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print("sub create");
    return SubState();
  }
}

class SubState extends State<SubTestStatefulWidget> {
  String name = 'sub test';

  @override
  initState() {
    print('sub init state');
    super.initState();
  }

  @override
  didChangeDependencies() {
    print('sub didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  didUpdateWidget(SubTestStatefulWidget oldWidget) {
    print('sub didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  deactivate() {
    print('sub deactivate');
    super.deactivate();
  }

  @override
  dispose() {
    print('sub dispose');
    super.dispose();
  }

  @override
  reassemble() {
    print('sub reassemble');
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    print('sub build');
    return Text('subname $name'); // 使用Text组件显示当前name state
  }
}
