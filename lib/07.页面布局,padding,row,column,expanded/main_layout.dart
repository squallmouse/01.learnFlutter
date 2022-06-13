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
///-->  布局的练习
///👆🏻*********************************/
//自定义以组件

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HeadView();
  }
}

class HeadView extends StatelessWidget {
  double height;
  HeadView({this.height = 300});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        // padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        // color: Colors.red,
        height: this.height,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black,
              ),
              flex: 3,
            ),
            Expanded(
              child: bottomView(),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class bottomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        // color: Colors.pink,
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Image.network(
                  "https://www.itying.com/images/flutter/1.png",
                  fit: BoxFit.cover,
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: RightTwo(),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}

class RightTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            height: 50,
            child: Image.network(
              "https://www.itying.com/images/flutter/7.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            height: 50,
            child: Image.network(
              "https://www.itying.com/images/flutter/6.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
