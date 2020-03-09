import 'package:flutter/material.dart';
import 'package:my_vtc/splashScreen.dart';

void main() => runApp(new MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false,));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new SplashScreenPage();

  }
}
