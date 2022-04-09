// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:grad_project/core/cache/UserCache.dart';
// import 'package:grad_project/ui/pages/auth/Login.dart';
// import 'package:grad_project/ui/pages/home/HomePage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SplashScreen extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _SplashScreen();
//   }
// }
// class _SplashScreen extends State<SplashScreen>  {
//
//   @override
//   Widget build(BuildContext context)  {
//
//
//     // TODO: implement build
//     return Scaffold(body :
//     Container(
//
//       child: Text("Welcome"),
//       foregroundDecoration: BoxDecoration(),
//     ),
//     );
//   }
//
//   @override
//   void initState()  {
//     // TODO: implement initState
//     super.initState();
//     Timer(Duration(seconds: 2),
//         ((){
//           if (UserCache.instance.getUserCache()==false || UserCache.instance.getUserCache() == null ){
//             Navigator.of(context).pushReplacement(
//                 new MaterialPageRoute(builder: (context) => new Login()));
//           }
//           else {
//             Navigator.of(context).pushReplacement(
//                 new MaterialPageRoute(builder: (context) => new HomePage()));
//           }
//         }())
//     );
//   }
//
//
// }