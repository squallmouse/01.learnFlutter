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

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChipDemo"),
      ),
      body: TestDemo(),
    );
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   界面传值
///基本使用
//👆🏻*********************************/

class TestDemo extends StatefulWidget {
  TestDemo({Key? key}) : super(key: key);

  @override
  State<TestDemo> createState() => _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  int _count = 0;

  _pressFunc() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChipDemo(_count, _pressFunc),
          IconButton(
            color: Colors.cyan[300],
            onPressed: _pressFunc,
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

//

class ChipDemo extends StatelessWidget {
  ChipDemo(this.index, this._callback);

  int index = 0;

  final VoidCallback _callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip(
        label: Text("${index}"),
        onDeleted: _callback,
      ),
    );
  }
}
