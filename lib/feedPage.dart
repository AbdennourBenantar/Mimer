import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:image_picker/image_picker.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  GlobalKey _bottomNavigationBarKey=GlobalKey();
  int selectedIndex=2;
  void postMeme(){
    setState(() {
      selectedIndex=1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: new Container(
        color: Color.fromRGBO(140,223,224,0.8),
        child:selectedIndex==1?(ListView.builder(
          itemBuilder: (BuildContext context,int index){
            return PostCard();
          },
        )):(new NewPost(postMeme:postMeme)),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index: selectedIndex,
        key: _bottomNavigationBarKey,
        items: <Widget>[
          Icon(Icons.person,size: 30,),
          Icon(Icons.filter_none,size: 30,),
          Icon(Icons.add,size:30),
          Icon(Icons.star,size: 30,),
        ],
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });
        },
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color.fromRGBO(140,223,224,1.0),
        color: Color.fromRGBO(140,223,224,1.0),
      )
    );
  }
}

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.8,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
        child: Card(
          child: Column(
            children: <Widget>[_PostDetails(),_Post()],
          ),
        ),
      ),
    );
  }
}
class _Post extends StatelessWidget {
  const _Post({Key key}) :super(key:key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: <Widget>[_PostTitle(),_PostImage()],
      ),
    );
  }
}
class _PostTitle extends StatelessWidget {
  const _PostTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTheme = Theme.of(context).textTheme.title;
    final String title = "This is a title";

    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left:15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(title, style: titleTheme),
          ],
        ),
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 7, child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset("assets/avatar.jpg",fit: BoxFit.contain,),
        ),
      ],
    ));
  }
}

class _PostDetails extends StatelessWidget {
  const _PostDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[_UserImage(), _UserNameAndHashTags()],
    );
  }
}

class _UserNameAndHashTags extends StatelessWidget {
  const _UserNameAndHashTags({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Abdenour",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Text("#meme #Da7ka",style: TextStyle(fontSize: 9),),
        ],
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: CircleAvatar(
          radius: 17,
          backgroundImage: AssetImage("assets/avatar.jpg",),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
class NewPost extends StatelessWidget{
  final _callBack;
    NewPost({@required void postMeme()}):_callBack=postMeme;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
        child: Card(
          child: Column(
            children: <Widget>[_NewPostDetails(),
              _NewPostTitle(),
              Expanded(child: Padding(
              padding: const EdgeInsets.all(8),
              child: AddNew(),
            )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  RaisedButton(
                    color: Color.fromRGBO(140,223,224,0.8),
                    onPressed: (){
                      _callBack();
                    },
                    child:Row(
                      children: <Widget>[
                        Icon(Icons.add_circle_outline,color: Colors.white,),
                        SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                        Text('Post',style: TextStyle(fontSize: 15,color: Colors.white),),
                        SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                      ],
                    ),
                  ),SizedBox(width: MediaQuery.of(context).size.width*0.02,)
                ],
              )
            ],
          ),
        ),
      ),
    );

  }
}
class _NewPostDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[_UserImage(), _UserNameAndHashTagsNewPost()],
    );
  }
}
class _NewPostTitle extends StatelessWidget {
  const _NewPostTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTheme = Theme.of(context).textTheme.title;
    final String title = "";

    return Expanded(
      flex: 0,
      child: Padding(
        padding: const EdgeInsets.only(left:15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
        Container(
          height: 50,

          width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            maxLines: 2,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Caption it",
          ),),
        )
          ],
        ),
      ),
    );
  }
}
class _UserNameAndHashTagsNewPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Abdenour",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Container(
              height: 30,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Add your hashtags here",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddNew extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AddNewState();
  }
}
class _AddNewState extends State<AddNew>{
  File image;
  Future getImage () async{
    var _image=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image=_image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return image==null?
    Container(
      color: Colors.grey,
      child: Center(
        child: Container(
          width: 90,
          height: 90,
          child:
          FloatingActionButton(
            backgroundColor: Colors.grey,
            onPressed: getImage,
            elevation: 80,
            foregroundColor: Color.fromRGBO(140,223,224,1.0),
            tooltip: 'Pick a meme',
            child: Icon(Icons.add,size: 30,),
          )
        ),
      ),
    ):
    Container(
        child: Image.file(image,fit: BoxFit.contain,));
  }
}

