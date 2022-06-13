import 'package:flutter/material.dart';
import 'package:FlutterDemo/08.Stack,Align,Positioned/main01.dart';

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
            "---------",
          ),
        ),
        body: MyHome(), // 封装的主体内容
      ),
    );
  }
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  StatefulWidget
/// 有状态组件 如果需要改变页面中的数据,
/// 使用setdata((){})
/// createState
///👆🏻*********************************/
//自定义以组件

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Text("点击了${this.count}次按钮"),
        SizedBox(height: 30),
        MaterialButton(
          child: Text("按钮"),
          color: Colors.pink,
          onPressed: () {
            setState(() {
              // 把改变的数据渲染到页面上
              this.count++;
            });

            print(this.count);
          },
        )
      ],
    );
  }
}

// class MyHome extends StatefulWidget {
//   int count = 1;
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//
//       children: [
//         SizedBox(height: 200,),
//         Text("点击了${this.count}次按钮"),
//         SizedBox(height:30),
//         MaterialButton(
//           child: Text("按钮"),
//           color:Colors.pink,
//           onPressed: () {
//             setState((){
//
//             })
//             this.count++;
//             print(this.count);
//
//           },
//         )
//       ],
//     );
//   }
// }

class Cell extends StatelessWidget {
  Map dic;

  Cell(this.dic);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              this.dic["imageUrl"],
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(this.dic["imageUrl"]),
            ),
            title: Text(this.dic["title"]),
            subtitle: Text(
              this.dic["description"],
              maxLines: 2,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}

List listData = [
  {
    "title": 'Candy Shop',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/1.png',
    "description":
        'Flutter is Google’s mobile UI framework for crafting high-quality native experiences on iOS and Android in record time. Flutter works with existing',
  },
  {
    "title": 'Childhood in a picture',
    "author": 'Google',
    "imageUrl": 'https://www.itying.com/images/flutter/2.png',
    "description":
        'Flutter is Google’s mobile UI framework for crafting high-quality native experiences on iOS and Android in record time. Flutter works with existing',
  },
  {
    "title": 'Alibaba Shop',
    "author": 'Alibaba',
    "imageUrl": 'https://www.itying.com/images/flutter/3.png',
    "description":
        'Dart is a client-optimized language for fast apps on any platform... Dart is a client-optimized language for fast apps on any platform Optimizedfor',
  },
  {
    "title": 'Candy Shop',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/4.png',
    "description":
        'Dart is a client-optimized language for fast apps on any platform... Dart is a client-optimized language for fast apps on any platform Optimizedfor',
  },
  {
    "title": 'Tornado',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/5.png',
    "description":
        'Flutter is Google’s mobile UI framework for crafting high-quality native experiences on iOS and Android in record time. Flutter works with existing',
  },
  {
    "title": 'Undo',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/6.png',
    "description":
        'Flutter is Google’s mobile UI framework for crafting high-quality native experiences on iOS and Android in record time. Flutter works with existing',
  },
  {
    "title": 'white-dragon',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/7.png',
    "description":
        'Dart is a client-optimized language for fast apps on any platform... Dart is a client-optimized language for fast apps on any platform Optimizedfor',
  }
];
