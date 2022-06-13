import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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
        title: Text("Bloc Demo"),
      ),
      body: AnimationDemo(),
    );
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   Bloc
/// Bloc
//👆🏻*********************************/

class AnimationDemo extends StatefulWidget {
  AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this, // TickerProviderStateMixin  60帧??
      duration: Duration(seconds: 3),
      lowerBound: 0.0, // 动画的范围 上限值
      upperBound: 100.0, // 动画的范围 结束值
      value: 32.0, // 动画的初始值
    );

    _animationController.addListener(() {
      print("${_animationController.value}"); // 输出每一帧动画的值
      setState(() {});
    });

    // _animationController.forward(); // 开始动画
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text("${_animationController.value}"),
        onPressed: () {
          print("clicked button");
          _animationController.forward();
        },
      ),
    );
  }
}
