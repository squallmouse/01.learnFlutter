import 'dart:convert';
// import 'dart:html';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

// --no-sound-null-safety
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("本地存储 Demo"),
      ),
      body: SharedPreferencesDemo(),
    );
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   shared_preferences:
/// 本地数据存储
/// ios : NSUserDefaut
/// android : SharedPreferences
//👆🏻*********************************/
// 存储数据
void test() async {
  // 获取 SharedPreferences 实例
  var prefs = await SharedPreferences.getInstance();

// 1. 存储数据  : set value
  prefs.setString("key_count", "value-value");
  // 2 .读取数据 :
  String value = await prefs.getString("key_count") ?? "nil";

  //3.  删除数据
  await prefs.remove("key_count");

  // 4.获取所有keys
  prefs.getKeys();
}

class SharedPreferencesDemo extends StatefulWidget {
  SharedPreferencesDemo({Key? key}) : super(key: key);

  @override
  State<SharedPreferencesDemo> createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
//
  String _result = "";
  int _count = 0;
  // late SharedPreferences prefs = await SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    // prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // +1 button
          MaterialButton(
            onPressed: _increment,
            child: Text("+1 button"),
          ),

          // 获取存储的值
          MaterialButton(
            onPressed: _getCount,
            child: Text("get count"),
          ),
          Divider(height: 5),
          Text("result : ${_result}"),
          Divider(height: 5),
          Text("counts :  ${_count}"),
        ],
      ),
    );
  }

  // increment
  _increment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _result = _result + "1";
      _count += 1;
    });

    await prefs.setString("_result", _result);
    await prefs.setInt("_count", _count);
    _count = prefs.getInt("_count") ?? 0;
  }

// 获取 count
  _getCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _count = prefs.getInt("_count") ?? -1;
    });
  }
}
