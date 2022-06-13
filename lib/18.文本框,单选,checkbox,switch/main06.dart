import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  Radio RadioListTile
/// 单选按钮组件
///👆🏻*********************************/
//自定义组件

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

//
class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField文本框组件"),
      ),
      body: Container(
        color: Colors.amber,
        alignment: Alignment.center,
        child: MyCheckbox(),
      ),
    );
  }
}

// Radio RadioListTile 文本框

class MyCheckbox extends StatefulWidget {
  MyCheckbox({Key? key}) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

//
class _MyCheckboxState extends State<MyCheckbox> {
  var _myNum = [0, 1, 2, 3];
  var _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];
  List _checkValueList = [
    false,
    false,
    false,
    false,
  ];
  bool _check = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _myNum
          .map((e) => Switch(
                value: _checkValueList[e],
                onChanged: (value) {
                  setState(() {
                    _checkValueList[e] = value;
                    print(_checkValueList);
                  });
                },
                inactiveThumbColor: _colors[e],
              ))
          .toList(),
    );
  }
}
