import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey=GlobalKey<FormState>();
  final Map<String,dynamic> loginFormData= {'email':null,'password':null};
  final focusPassword =FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          CustomPaint(
              painter: BgPainter(),
              child: new Container(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,230,0),
            child: Center(
              child: new Column(
                children: <Widget>[
                  new SizedBox(height: MediaQuery.of(context).size.height*0.23,),
                  new Text("Welcome\nBack",textAlign: TextAlign.left,style: GoogleFonts.muli(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40,360,40,0),
            child: Form(
              key:_formKey ,
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: new TextFormField(keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (v){
                            FocusScope.of(context).requestFocus(focusPassword);
                          },
                          onSaved: (String value){
                            loginFormData['email']=value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email,color: Colors.black,),
                              ),
                            validator: (String value){
                              if(!RegExp(
                                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(value)){
                                return 'this is not a valid email';
                              }else{return "";}
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.03,
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: new TextFormField(obscureText: true,
                            focusNode: focusPassword,
                            onFieldSubmitted: (v){
                              if(_formKey.currentState.validate())
                              {
                                _formKey.currentState.save();
                              }
                            },
                            onSaved: (String value){
                            loginFormData['password']=value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock,color: Colors.black,),
                            ),
                            validator: (String value){
                              if(value.trim().isEmpty)
                                {
                                  return 'Password is required';
                                }
                              else{
                                return "";
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.08,
                    ),
                    Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 240),
                        child: Container(
                          height: 75,
                          width: 75,
                          margin: EdgeInsets.only(bottom: 25),
                          child: FittedBox(
                            child: FloatingActionButton(
                              splashColor: Color.fromRGBO(140,223,224,1.0),
                              onPressed: (){
                                if(_formKey.currentState.validate())
                                  {
                                    _formKey.currentState.save();
                                  }
                              },
                              child: Icon(Icons.forward),
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                    )
                  ],
                ),
              ),
            ),
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
