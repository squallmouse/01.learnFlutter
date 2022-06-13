import 'package:flutter/material.dart';

// import 'listData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // 导航栏
          title: Text(
            "ListView动态列表",
          ),
        ),
        body: MyHome(), // 封装的主体内容
      ),
    );
  }
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  stack  Aglin
/// Stack 组件中结合 Align 组件可以控制每个子元素的显示位置
///👆🏻*********************************/
//自定义以组件

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.pink,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "第1个text",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Align(
              alignment: Alignment(-1, -0.3),
              child: Text(
                "第2个text!!!!!!!!!!!!",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.5, 1),
              child: Text(
                "第3个text~~~~~~~~~",
                style: TextStyle(
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
