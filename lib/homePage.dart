
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          CustomPaint(
              painter: BgPainter(),
              child: new Container(),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              new SizedBox(height: MediaQuery.of(context).size.height*0.25,),
              new Text("Welcome\nBack",textAlign: TextAlign.left,style: TextStyle(fontFamily:"Trebuchet",color: Colors.orangeAccent),),
            ],
          )
        ],
      )
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
    path.lineTo(0, size.height*0.2);
    path.cubicTo(size.width*0.25,size.height*0.2,size.width*0.5,size.height*0.3,size.width*0.6,size.height*0.4);
    path.cubicTo(size.width*0.8,size.height*0.55,size.width*0.9,size.height*0.5,size.width*1,size.height*0.5);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);

    //path2
    paint.color = Color.fromRGBO(18,21,27, 1);
    path=new Path();
    path.lineTo(0, size.height*0.35);
    path.cubicTo(size.width*0.25,size.height*0.5 , size.width*0.35, size.height*0.35,size.width*0.5, size.height*0.28);
    path.cubicTo(size.width*0.65,size.height*0.22 , size.width*0.8, size.height*0.2,size.width*1, size.height*0.08);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
    //path3
    paint.color = Color.fromRGBO(140, 200, 250, 1);
    path=new Path();
    path.lineTo(0, size.height*0.2);
    path.cubicTo(size.width*0.1,size.height*0.22, size.width*0.3, size.height*0.05,size.width*0.4,size.height*0.04);
    path.cubicTo(size.width*0.5,size.height*0.02 , size.width*0.6, size.height*0.05,size.width*0.8,0);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
