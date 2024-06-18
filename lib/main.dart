import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Controller/LoginController.dart';
import 'package:loanmanagement/Screens/Authentication/Login.dart';
import 'package:loanmanagement/Screens/Dashbord.dart';
void main() {
  runApp(GetMaterialApp(home: const MyApp(),
  debugShowCheckedModeBanner: false,

  theme: ThemeData.light(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan ManageMent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Loan Management'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(milliseconds: 1500), () {Get.offAll(Loginpage()); });
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
backgroundColor: Colors.white,
body: Center(child: Container(height: 250,width: MediaQuery.of(context).size.width,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/splashscreenlogo.png"))),),),
    );
}
}
