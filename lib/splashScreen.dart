import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_vtc/homePage.dart';
import 'package:my_vtc/signupPage.dart';

class SplashScreenPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_SplashScreenState();
}
class _SplashScreenState extends State<SplashScreenPage> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController=AnimationController (
      vsync: this,
      duration: Duration(seconds: 4),
    )..addListener(()=>setState((){}));
    animation=CurvedAnimation(
      parent: animationController,
      curve: Curves.linearToEaseOut);
    animationController.forward();
    Future.delayed(
      Duration(seconds: 5),(){
        Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder: (context)=>SignUpPage(),
            ));
    }
    );
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(140,223,224,1.0),
      body: new Center(
        child: ScaleTransition(
          scale: animation,
          child: Container(
            child: Image(
              image: AssetImage("assets/logo_transparent.png"),
            ),
          ),
        ),
      ),
    );
  }
}