import 'dart:async';
import 'dart:developer';

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
    return CountInherited(
      bloc: CountBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bloc Demo"),
        ),
        body: CountChipDemo(),
        floatingActionButton: CountActionButton(),
      ),
    );
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   Bloc
/// Bloc
//👆🏻*********************************/

// 计算chip
class CountChipDemo extends StatelessWidget {
  const CountChipDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountBloc _countBloc = CountInherited.of(context)!.bloc;

    return Center(
      child: StreamBuilder(
        stream: _countBloc.Counter,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: ActionChip(
              label: Text("${snapshot.data}"),
              onPressed: () {
                _countBloc.log();
                _countBloc.count.add(1); // // 输入信号
              },
            ),
          );
        },
      ),
    );
  }
}

// 浮动按钮
class CountActionButton extends StatelessWidget {
  const CountActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountBloc _countBloc = CountInherited.of(context)!.bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _countBloc.log();
        _countBloc.count.add(1); // 输入信号 --> count.listen(ondata)
        /*
          count 是一个流, add()是往流里 输入/添加 一个信号;
          因为 count实现了监听, 添加信号的时候会触发 ondata 方法(监听到数据输入);
          ondata 中又往 counter流中添加了信号;
          StreamBuilder(stream: _countBloc.Counter,) stream:绑定了一个流;
          当这个stream 有变化, 就会重新布局这个小部件
        
        */
      },
    );
  }
}

class CountInherited extends InheritedWidget {
  CountInherited({Key? key, required this.child, required this.bloc})
      : super(key: key, child: child);

  final Widget child;
  final CountBloc bloc;

  static CountInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CountInherited>();
  }

  @override
  bool updateShouldNotify(CountInherited oldWidget) {
    return true;
  }
}

class CountBloc {
  int _count = 0;
  //
  final _countActionController = StreamController();
  StreamSink get count => _countActionController.sink;
  //
  final _countController = StreamController();
  Stream get Counter => _countController.stream;
  // 构造器
  CountBloc() {
    _countActionController.stream.listen(onData); // 给流添加了监听
  }
  // dealloc
  void dispose() {
    _countActionController.close();
    _countController.close();
  }

// 接收到信号的输入
  void onData(data) {
    print(data);
    _count += data as int;
    _countController.add(_count);
  }

  //test
  void log() {
    print(123);
  }
}
