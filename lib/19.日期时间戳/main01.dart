// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

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
///-->  DateTime
///日期时间戳
///👆🏻*********************************/
//自定义组件

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

//
class _MyHomeState extends State<MyHome> {
  var now = new DateTime.now(); // 现在的时间
  // var a = now.millisecondsSinceEpoch; // 时间戳
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("现在的时间 : ${now}");
    print("--------------------");
    print("时间戳 : ${now.millisecondsSinceEpoch}");
  }

  @override
  Widget build(BuildContext context) {
    var a = now.millisecondsSinceEpoch;
    var timeStr =
        formatDate(now, [yyyy, '年', mm, '月', dd, ' --', HH, ':', nn, ':', ss]);
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField文本框组件"),
      ),
      body: Container(
        color: Colors.amber,
        alignment: Alignment.center,
        child: Text("现在的时间是 : ${timeStr}"),
      ),
    );
  }
}
