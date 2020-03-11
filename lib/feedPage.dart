import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  GlobalKey _bottomNavigationBarKey=GlobalKey();
  int selectedIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: new Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context,int index){
            return PostCard();
          },
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        key: _bottomNavigationBarKey,
        items: <Widget>[
          Icon(Icons.person,size: 30,),
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
      aspectRatio: 5/2,
      child: Card(
        child: Column(
          children: <Widget>[_Post(),_PostDetails()],
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
      child: Row(
        children: <Widget>[_PostImage(),_PostTitleAndSummary()],
      ),
    );
  }
}
class _PostTitleAndSummary extends StatelessWidget {
  const _PostTitleAndSummary({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTheme = Theme.of(context).textTheme.title;
    final TextStyle summaryTheme = Theme.of(context).textTheme.body1;
    final String title = "This is a title";
    final String summary = "This is summary";

    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(title, style: titleTheme),
          Text(summary, style: summaryTheme),
        ],
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 2, child: Image.asset("assets/logo_transparent.png"));
  }
}

class _PostDetails extends StatelessWidget {
  const _PostDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[_UserImage(), _UserNameAndEmail()],
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Abdenour"),
          Text("mail@esi.dz"),
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
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/logo_transparent.png"),
      ),
    );
  }
}
