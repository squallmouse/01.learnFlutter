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
///-->   Expanded
/// 自适应布局 铺满整个 行 或者 列  , 按比例分配.
///👆🏻*********************************/
//自定义以组件

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    MyData data = MyData(); // 获取数据
    List<Widget> datalist = data.getListData();
    return Row(
      children: [
        Expanded(
          child: myIcon(Icons.home, color: Colors.red),
          flex: 1,
        ),
        Expanded(
          child: myIcon(Icons.search, color: Colors.blue),
          flex: 2,
        )
      ],
    );
  }
}

class myIcon extends StatelessWidget {
  IconData iconsName;
  double size;
  Color color;
  myIcon(this.iconsName, {this.size = 32.0, this.color = Colors.red});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      color: this.color,
      child: Center(
          child: Icon(
        this.iconsName,
        size: this.size,
        color: Colors.white,
      )),
    );
  }
}

class MyData {
// title
// author
//imageUrl

  List<Widget> getListData() {
    List<Widget> list = [];

    for (var i = 0; i < listData.length; i++) {
      var temp = Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Image.network(
          listData[i]["imageUrl"],
          fit: BoxFit.cover,
        ),
      );

      list.add(temp);
    }

    return list;
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   数据源
//👆🏻*********************************/

List listData = [
  {
    "title": 'Candy Shop',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/1.png',
  },
  {
    "title": 'Childhood in a picture',
    "author": 'Google',
    "imageUrl": 'https://www.itying.com/images/flutter/2.png',
  },
  {
    "title": 'Alibaba Shop',
    "author": 'Alibaba',
    "imageUrl": 'https://www.itying.com/images/flutter/3.png',
  },
  {
    "title": 'Candy Shop',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/4.png',
  },
  {
    "title": 'Tornado',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/5.png',
  },
  {
    "title": 'Undo',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/6.png',
  },
  {
    "title": 'white-dragon',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/7.png',
  }
];
