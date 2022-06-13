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
///-->showModalBottomSheet
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
    _showModalBottomSheet() async {
      await showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 200,
            child: Column(
              children: [
                ListTile(
                  title: Text("分享 A"),
                  onTap: () {
                    Navigator.pop(context, "A");
                  },
                ),
                ListTile(
                  title: Text("分享 B"),
                  onTap: () {
                    Navigator.pop(context, "B");
                  },
                ),
                ListTile(
                  title: Text("分享 C"),
                  onTap: () {
                    Navigator.pop(context, "C");
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Container(
      child: Column(
        children: [
          SizedBox(height: 50),
          MaterialButton(
            onPressed: _showModalBottomSheet,
            child: Text("showModalBottomSheet"),
          ),
        ],
      ),
    );
  }
}
