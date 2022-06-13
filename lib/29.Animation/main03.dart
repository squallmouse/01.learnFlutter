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
///-->   动画的范围
/// animationStatus : 动画的状态
/// Tween  动画范围
//👆🏻*********************************/

class AnimationDemo extends StatefulWidget {
  AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation _animation;
  late Animation _animationColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this, // TickerProviderStateMixin  60帧??
      duration: Duration(seconds: 1),
      // lowerBound: 32.0, // 动画的范围 上限值
      // upperBound: 100.0, // 动画的范围 结束值
      // value: 50.0, // 动画的初始值
    );

    // 没一帧 都会进入这个回调一次
    _animationController.addListener(() {
      // print("${_animationController.value}"); // 输出每一帧动画的值
      setState(() {});
    });

// 监听动画的完成状态
    _animationController.addStatusListener((status) {
      print(status);
    });

// 动画的范围值  . 动画的控制器
    _animation = Tween(begin: 32.0, end: 100.0).animate(_animationController);

    _animationColor = ColorTween(
      begin: Colors.black,
      end: Colors.red,
    ).animate(_animationController);
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
      child: IconButton(
        icon: Icon(Icons.favorite),
        iconSize: _animation.value,
        color: _animationColor.value,
        onPressed: () {
          print("clicked button");
          switch (_animationController.status) {
            case AnimationStatus.completed:
              _animationController.reverse();
              break;
            default:
              _animationController.forward();
          }
        },
      ),
    );
  }
}
