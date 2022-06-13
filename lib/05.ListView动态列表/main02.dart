import 'package:flutter/material.dart';
import 'listData.dart';
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
///-->   list
/// listview.bulider
///👆🏻*********************************/
//自定义以组件

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // MyData da = MyData();

    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(listData[index]["title"]),
          subtitle: Text(listData[index]["author"]),
          leading: Image.network(listData[index]["imageUrl"]),
        );
      },
    );
  }
}

// class MyData {
// // title
// // author
// //imageUrl

//   List<Widget> getData() {
//     var templist = listData.map((e) {
//       return ListTile(
//         title: Text(e["title"]),
//         subtitle: Text(e["author"]),
//         leading: Image.network(e["imageUrl"]),
//       );
//     });
//     return templist.toList();
//   }
// }
