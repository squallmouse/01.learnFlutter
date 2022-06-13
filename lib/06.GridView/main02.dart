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
///-->   GridView
/// GridView.bulider
///👆🏻*********************************/
//自定义以组件

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    MyData data = MyData(); // 获取数据
    List<Widget> buildList = data.getListData();
    return GridView.builder(
      itemCount: buildList.length,
      itemBuilder: (context, index) {
        return buildList[index];
      },
      // gridDelegate 设置间隔的方法要放在这个代理里面
      //没有padding , 可以再最外层包裹一层container , 设置padding.
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
    );
  }
}

class MyData {
// title
// author
//imageUrl

  List<Widget> getListData() {
    List<Widget> list = [];

    for (var i = 0; i < 20; i++) {
      var temp = Container(
        child: Text(
          "这是第${i}个container",
          maxLines: 2,
          style: TextStyle(
            color: Colors.blue[600],
            fontSize: 20,
          ),
        ),
        alignment: Alignment.center,
        color: Color.fromARGB(255, 234, 191, 48),
      );

      list.add(temp);
    }

    return list;
  }
}
