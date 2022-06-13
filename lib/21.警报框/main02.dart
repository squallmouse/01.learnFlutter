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
///-->SimpleDialog
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
    // 2.............SimpleDialog
    // showDialog 是一个异步的方法
    _simpleDialog() async {
      final result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("SimpleDialog -- select单选按钮框"),
            children: [
              SimpleDialogOption(
                child: Text("Option A"),
                onPressed: () {
                  Navigator.pop(context, 'Option A');
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("Option B"),
                onPressed: () {
                  Navigator.pop(context, 'Option B');
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("Option C"),
                onPressed: () {
                  Navigator.pop(context, 'Option C');
                },
              ),
            ],
          );
        },
      );

      print("simpleDialog Option = ${result}");
    }

    return Container(
      child: Column(
        children: [
          SizedBox(height: 50),
          MaterialButton(
            onPressed: _simpleDialog,
            child: Text("SimpleDialog -- "),
          ),
        ],
      ),
    );
  }
}
