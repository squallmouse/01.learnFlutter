import 'package:flutter/material.dart';

import '../12.BottomNavigationBar/main01.dart';

// import '../0.pages/MySetting.dart';
// import '../0.pages/MyCategory.dart';
// import '../0.pages/MyHome.dart';
// import '../main.dart';
import '../0.pages/Search.dart';
import '../0.pages/Form.dart';

var myRoutes = {
  '/': (context) => MyTab(
        count: 0,
      ),
  // arguments : 特定的参数
  '/search': (context, {arguments}) => SearchPage(arg: arguments),
  '/form': (context) => MyForm(),
};

/*     Navigator.pushNamed(
       context,
       '/search', // setting.name
       arguments: {"title": "search!!", 'ID': 20} // setting.arguments
      );
*/
/// navigator.push...  生成路由 来到 onGenerateRoute 方法
///
/*
const RouteSettings({
    this.name, // String?
    this.arguments, // Object?
  });
*/
class MyRoute {
  var onGenerateRoute = (RouteSettings settings) {
    //统一处理
    String? name = settings.name;
    Function pageContentBuilder = myRoutes[name] as Function;
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        // 有参数的 构造方法
        final Route route = MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, arguments: settings.arguments));
        return route;
      } else {
        // 没有参数的 构造方法
        final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context),
        );
        return route;
      }
    } else {
      print("${name}  :  没有对应的构造方法");
    }
  };
}
