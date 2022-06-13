import 'dart:async';

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
      body: SteamDemo(),
    );
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   Stream
/// 监听函数 onError , onDone 方法
/// StreamSubscription 可以改变监听的状态 , 暂停,恢复,取消
//👆🏻*********************************/

class SteamDemo extends StatefulWidget {
  SteamDemo({Key? key}) : super(key: key);

  @override
  State<SteamDemo> createState() => _SteamDemoState();
}

// ----
class _SteamDemoState extends State<SteamDemo> {
  late StreamSubscription _streamSubscription; // 监听的各种状态
  @override
  void initState() {
    super.initState();

    print("创建一个 Stream");
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());

    print("开始监听 Stream");
    _streamSubscription = _streamDemo.listen(_onData,
        onError: _onError, onDone: _onDone); // 监听 有数据,有错误,完成时
    print("initialize completed");
  }

  void _onData(String data) {
    print("${data}");
  }

  void _onError(error) {
    print("Erroe : ${error}");
  }

  void _onDone() {
    print("Done!");
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw "some error happened!!";
    return "Hello";
  }

  // 监听状态的方法们

  void _PauseFunc() {
    print("Pause");
    _streamSubscription.pause();
  }

  void _ResumeFunc() {
    print("Resume");
    _streamSubscription.resume();
  }

  void _CancleFunc() {
    print("Cancle");
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ActionChip(
            label: Text("Pause"),
            onPressed: _PauseFunc,
          ),
          ActionChip(
            label: Text("Resume"),
            onPressed: _ResumeFunc,
          ),
          ActionChip(
            label: Text("Cancle"),
            onPressed: _CancleFunc,
          ),
        ],
      ),
    );
  }
}
