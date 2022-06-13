// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

// // flutter run  --no-sound-null-safety
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHome(),
//     );
//   }
// }

// ///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
// ///-->  flutter_swiper
// ///轮播图
// ///   flutter_swiper  :  第三方轮播图
// /// https://pub.dev/packages/flutter_swiper
// ///👆🏻*********************************/
// //自定义组件

// class MyHome extends StatefulWidget {
//   MyHome({Key? key}) : super(key: key);

//   @override
//   State<MyHome> createState() => _MyHomeState();
// }

// //
// class _MyHomeState extends State<MyHome> {
//   List<Map> list = [
//     {"url": "https://www.itying.com/images/flutter/1.png"},
//     {"url": "https://www.itying.com/images/flutter/2.png"},
//     {"url": "https://www.itying.com/images/flutter/3.png"},
//     {"url": "https://www.itying.com/images/flutter/4.png"},
//     {"url": "https://www.itying.com/images/flutter/5.png"},
//     {"url": "https://www.itying.com/images/flutter/6.png"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("TextField文本框组件"),
//       ),
//       body: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             child: AspectRatio(
//               aspectRatio: 16.0 / 9.0,
//               child: Swiper(
//                 itemCount: list.length,
//                 itemBuilder: (context, index) {
//                   return Image.network(
//                     this.list[index]["url"],
//                     fit: BoxFit.cover,
//                   );
//                 },
//                 pagination: SwiperPagination(),
//                 autoplay: true,
//                 onTap: (index) {
//                   print("index = ${index}");
//                 },
//                 // duration: 1,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
