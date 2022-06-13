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
            "---------",
          ),
        ),
        body: MyHome(), // 封装的主体内容
      ),
    );
  }
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  wrap
/// 可以实现流布局 当主轴空间不足后,可以扩展到crossAxis上
///👆🏻*********************************/
//自定义以组件

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(

      runSpacing: 15,
      spacing: 10,
      direction: Axis.horizontal,
      // 主轴方向
      alignment: WrapAlignment.spaceEvenly,
      children: [
        Container(width: 160,height: 60,color: Colors.red,),
        Container(width: 60,height: 60,color: Colors.red,),
        Container(width: 260,height: 60,color: Colors.red,),
        Container(width: 160,height: 60,color: Colors.red,),
        Container(width: 60,height: 60,color: Colors.red,),Container(width: 160,height: 60,color: Colors.red,),
        Container(width: 160,height: 60,color: Colors.red,),
        Container(width: 160,height: 60,color: Colors.red,),
        Container(width: 60,height: 60,color: Colors.red,),
        Container(width: 160,height: 60,color: Colors.red,),


        // Text("1111111111111"),
        // Text("222222"),
        // Text("33333"),
        // Text("4444444"),
        // Text("555555"),
        // Text("6666666"),
        // Text("777777777"),
        // Text("888888888"),
        // Text("99999999"),
        // Text("101010101010"),
        // Text("------"),
      ],
    );
  }
}

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
