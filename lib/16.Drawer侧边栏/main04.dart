import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  UserAccountsDrawerHeader 侧边栏
///可以手动滑出,也可以通过点击按钮显示
///   drawer: Drawer(child: Text("左边侧边栏")),
///   endDrawer: Drawer(child: Text("右边侧边栏")),
///👆🏻*********************************/
//自定义组件

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer 侧边栏"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("用户名"),
              accountEmail: Text("用户邮箱"),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://www.itying.com/images/flutter/4.png"),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://www.itying.com/images/flutter/6.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              // 其它用户图片
              otherAccountsPictures: [
                Image.network("https://www.itying.com/images/flutter/1.png"),
                Image.network("https://www.itying.com/images/flutter/2.png"),
                Image.network("https://www.itying.com/images/flutter/3.png"),
              ],
            ),
            ListTile(
              title: Text("个人中心"),
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
            ),
            Divider(),
            ListTile(
              title: Text("系统设置"),
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
            ),
            Divider(),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return TestPage();
                    },
                  ),
                );
              },
              child: ListTile(
                title: Text("跳转页面"),
                leading: CircleAvatar(
                  child: Icon(Icons.home),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("跳转的另外一个页面"),
      ),
      body: Container(
        color: Colors.pink,
        child: Text("页面"),
      ),
    );
  }
}
