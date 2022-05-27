// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:foodapp/Registeraion/LoginScreen.dart';
// import 'package:foodapp/views/home.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key, key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Timer(Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: ((context) => HomePage())));
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: Colors.white,
//           body: Image.asset(
//             "assets/images/splash.avif",
//             fit: BoxFit.cover,
//           )),
//     );
//   }
// }
