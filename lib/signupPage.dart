import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey _formKey=new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          CustomPaint(
            painter: BgPainter(),
            child: new Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 230, 0),
                    child: Center(
                      child: new Column(
                        children: <Widget>[
                          new SizedBox(height: MediaQuery.of(context).size.height*0.23,),
                          new Text("Welcome",textAlign: TextAlign.left,style: GoogleFonts.muli(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 20.0,
                                  color: Colors.cyan,
                                  offset: Offset(2.0,1.0),
                                ),
                              ]),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
class BgPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color=Colors.white;
    var rect=Rect.fromLTWH(0.0, 0.0, size.width,size.height);
    canvas.drawRect(rect, paint);

    //bg paths
    //path1
    paint.color = Color.fromRGBO(140, 223, 224, 1);
    var path=new Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width*0.42, size.height);
    path.cubicTo(size.width*0.5,size.height*0.89,size.width*0.6,size.height*0.85,size.width*0.65,size.height*0.83);
    path.cubicTo(size.width*0.7,size.height*0.8,size.width*0.9,size.height*0.8,size.width*1,size.height*0.7);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);

    //path2
    paint.color = Color.fromRGBO(18,21,27, 1);
    path=new Path();
    path.lineTo(0, size.height*0.55);
    path.cubicTo(size.width*0.26,size.height*0.42 , size.width*0.38, size.height*0.42,size.width*0.5, size.height*0.46);
    path.cubicTo(size.width*0.65,size.height*0.5 , size.width*0.8, size.height*0.48,size.width*1, size.height*0.26);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
