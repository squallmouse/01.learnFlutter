import 'package:flutter/material.dart';

// import 'package:flutter_swiper/flutter_swiper.dart';

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

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->AlertDialog
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
      body: Page(),
    );
  }
}

class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1.............AlertDialog
    _alertRel() async {
      var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("AlertDialog--title"),
            content: Text("AlertDialog -- content"),
            actions: [
              Divider(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Text("确定"),
                        onTap: () {
                          Navigator.pop(context, "OK");
                        },
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Text("取消"),
                        onTap: () {
                          Navigator.pop(context, "Cancle");
                        },
                      )
                    ],
                  )
                ],
              ),
            ],
          );
        },
      );

      print(result);
    }

    return Container(
      child: Column(
        children: [
          SizedBox(height: 50),
          MaterialButton(
            onPressed: _alertRel,
            child: Text("AlertDialog"),
          ),
        ],
      ),
    );
  }
}
