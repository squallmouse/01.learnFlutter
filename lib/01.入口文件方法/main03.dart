import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   1. materialApp  Scaffold
///materialApp : 一般作为顶层使用; 包含路由生成器,主题,语言,主页等属性
///Scaffold : 布局的基本实现;
///👆🏻*********************************/
//自定义以组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "我是一个标题",
      home: Scaffold(
        appBar: AppBar(
          // 导航栏 头部组件
          title: Text(
            // 导航栏标题
            "appBar的标题",
          ),
        ),
        body: MyHome(), // 封装的主体内容
      ),
      theme: ThemeData(primaryColor: Colors.purple),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        "nihaoya~~~333",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
