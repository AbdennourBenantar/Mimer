import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vtc/feedPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final Map<String,dynamic> signUpData={'username':null,'email':null,'password':null};
  final _formKey=new GlobalKey<FormState>();
  final focusEmail=new FocusNode();
  final focusPassword=new FocusNode();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomPaint(
        painter: BgPainter(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 230, 0),
                child: Center(
                  child: new Column(
                    children: <Widget>[
                      new SizedBox(height: MediaQuery.of(context).size.height*0.23,),
                      new Text("Create\nAccount",textAlign: TextAlign.left,style: GoogleFonts.muli(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40,70,40,0),
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
                                style: TextStyle(color: Colors.white),
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (v){
                                  FocusScope.of(context).requestFocus(focusEmail);
                                },
                                onSaved: (String value){
                                  signUpData['username']=value;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromRGBO(0,0,0,1))
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromRGBO(0,0,0,1))
                                  ),
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: 'Username',
                                  prefixIcon: Icon(Icons.email,color: Colors.white,),
                                ),
                                validator: (String value){
                                  if(value.trim().isEmpty)
                                    {
                                      return'Username is required';
                                    }else{
                                    return"";
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.04,
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: new TextFormField(keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(color: Colors.white),
                                focusNode: focusEmail,
                                onFieldSubmitted: (v){
                                  FocusScope.of(context).requestFocus(focusPassword);
                                },
                                onSaved: (String value){
                                  signUpData['email']=value;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromRGBO(0,0,0,1))
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromRGBO(0,0,0,1))
                                  ),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(Icons.email,color: Colors.white,),
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
                          height: MediaQuery.of(context).size.height*0.04,
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: new TextFormField(obscureText: true,
                                focusNode: focusPassword,
                                style: TextStyle(color: Colors.white),
                                onFieldSubmitted: (v){
                                  if(_formKey.currentState.validate())
                                  {
                                    _formKey.currentState.save();
                                  }
                                },
                                onSaved: (String value){
                                  signUpData['password']=value;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromRGBO(0,0,0,1))
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromRGBO(0,0,0,1))
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(Icons.lock,color: Colors.white,),
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
                          height: MediaQuery.of(context).size.height*0.05,
                        ),
                        Row(children: <Widget>[
                          Text("Sign up",style: GoogleFonts.muli(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 30.0,
                                  color: Colors.white,
                                  offset: Offset(2.0,2.0),
                                ),
                              ]),),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(170,10, 0 ,0),
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
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                            builder: (context)=>SignUpPage(),
                                          ));                                          }
                                  },
                                  child: Icon(Icons.forward),
                                  backgroundColor: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      ],
                    ),
                  ),

                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: GestureDetector(
                        child: Text("Sign in",
                          style: GoogleFonts.dancingScript(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,shadows:[
                            Shadow(
                              blurRadius: 50.0,
                              color: Colors.black,
                              offset: Offset(5.0,5.0),
                            ),],),
                        ),
                        onTap: (){
                          //TODO: implement :saving new user to firebase
                          Navigator.pushReplacement(context, new MaterialPageRoute(builder:(context)=> FeedPage()));

                        },
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
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
