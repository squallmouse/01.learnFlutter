import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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
        title: Text("Bloc Demo"),
      ),
      body: HttpDemo(),
    );
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   http
/// 会返回一个http.Response 的 future
//👆🏻*********************************/

class HttpDemo extends StatefulWidget {
  HttpDemo({Key? key}) : super(key: key);

  @override
  State<HttpDemo> createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  @override
  void initState() {
    super.initState();
    // fetchPost();
  }

//*  ------------------------------ */
//*    http 库的使用
//
  Future<List<PostModel>> fetchPost() async {
    //1. 通过 http 的方法 获取 response
    final result = await http
        .get(Uri.parse("https://resources.ninghao.net/demo/posts.json"));
    // 2. 通过response.statusCode 翻盘获取内容是否成功
    if (result.statusCode == 200) {
      // 3. 把 response.body  反序列化
      final responseBody = json.decode(result.body); // 反序列化
      List resLisst = responseBody["posts"];
      //  4. 自定义的model类
      List<PostModel> finalResult =
          resLisst.map((e) => PostModel.fromJson(e)).toList();

      return finalResult;
    } else {
      throw Exception("http faild!!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPost(),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // snapshot.hasData // 有非空数据
        // snapshot.data // 异步计算 接收到的最新数据
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text("loading...."),
          );
        }

        return ListView(
          children: snapshot.data.map<Widget>((PostModel item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: Image.network(item.imageUrl),
            );
          }).toList(),
        );
      },
    );
  }
}

class PostModel {
  late int id;
  late String title;
  late String author;
  late String description;
  late String imageUrl;

  PostModel(
      {this.id = -1,
      this.title = "",
      this.author = "",
      this.description = "",
      this.imageUrl = ""});

  PostModel.fromJson(Map json)
      : title = json["title"],
        id = json["id"],
        author = json["author"],
        description = json["description"],
        imageUrl = json["imageUrl"];
}
