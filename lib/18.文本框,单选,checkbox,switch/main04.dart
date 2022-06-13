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
  int _groupValue = 1;

  var data = [1, 2, 3, 4, 5];

  @override
  void initState() {
    super.initState();
    _groupValue = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: data.map((e) {
          return Row(
            children: [
              Text("Radio -- ${e}"),
              Radio<int>(
                value: e,
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    this._groupValue = value!;
                    print(value);
                  });
                },
                activeColor: Colors.red,
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}
