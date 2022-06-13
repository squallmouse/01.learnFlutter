import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   1. text contain
///materialApp : 一般作为顶层使用
///Scaffold : 布局的基本实现
///👆🏻*********************************/
//自定义以组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // 导航栏
          title: Text(
            "Container&Text组件",
          ),
        ),
        body: MyHome(), // 封装的主体内容
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Text 文本
    var _myText = Text(
      "我是一个文本,很长很长!!!我是一个文本,很长很长!!!我是一个文本,很长很长!!!我是一个文本,很长很长!!!我是一个文本,很长很长!!!",
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr, //方向
      overflow: TextOverflow.ellipsis, // 超出文本框的样式
      maxLines: 2, // 最大行数
      style: TextStyle(
        backgroundColor: Colors.grey,
      ),
    );

    return Center(
      child: Container(
        // 相当于是一个<div>
        child: _myText, //text文本

        height: 300.0,
        width: 150.0,
        alignment: Alignment.center, //子组件的对齐方式
        // padding: ,// 内边距

        decoration: BoxDecoration(
          // 装饰
          color: Colors.white,
          border: Border.all(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
