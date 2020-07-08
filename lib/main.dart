import 'package:flutter/material.dart';
//import 'package:flutter_chat/views/signin.dart';
import 'package:flutter_chat/views/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignUp(),
    );
  }
}
