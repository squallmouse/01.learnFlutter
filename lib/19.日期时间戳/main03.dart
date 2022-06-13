import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      localizationsDelegates: [
        //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        //此处
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
    );
  }
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  DateTime
///日期时间戳
///   date_format  :  第三方时间格式
/// http://bbs.itying.com/topic/5cfb2a12f322340b2c90e764
///👆🏻*********************************/
//自定义组件

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

//
class _MyHomeState extends State<MyHome> {
  var now = new DateTime.now(); // 现在的时间
  var _time = TimeOfDay.now();
  // var a = now.millisecondsSinceEpoch; // 时间戳
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("现在的时间 : ${now}");
    print("--------------------");
    print("时间戳 : ${now.millisecondsSinceEpoch}");
  }

  @override
  Widget build(BuildContext context) {
    var a = now.millisecondsSinceEpoch;
    var timeStr =
        formatDate(now, [yyyy, '年', mm, '月', dd, ' --', HH, ':', nn, ':', ss]);

// 日期组件
    _showDatePicker() async {
      var date = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(1950),
        lastDate: DateTime(2050),
      );
      // ignore: unnecessary_null_comparison
      if (date == null) return;
      print(date);

      setState(() {
        now = date;
      });
    }

// 时间组件

    _showTimePicker() async {
      var time = await showTimePicker(
        context: context,
        initialTime: _time,
      );
      if (time == null) return;
      print(time);
      setState(() {
        _time = time;
        print("_time = ${_time}");
      });
    }

//
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField文本框组件"),
      ),
      body: Container(
        color: Colors.amber,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        formatDate(now, [yyyy, '-', mm, '-', dd]),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: _showDatePicker,
                ),
                InkWell(
                  child: Row(
                    children: [
                      Text("${_time.format(context)}"),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: _showTimePicker,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
