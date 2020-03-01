import 'package:flutter/material.dart';

var imgUrl =
    "https://pbs.twimg.com/profile_images/988775660163252226/XpgonN0X_400x400.jpg";

var imgUrlSteveJobs =
    "https://www.infomoney.com.br/wp-content/uploads/2019/06/steve-jobs-2010.jpg?fit=900%2C882&quality=75&strip=all";

var imgPost =
    "https://www.gatesfoundation.org/-/media/GFO/Home/DE068721_1_676x380.ashx?h=380&la=en&w=676&hash=0058F305CC6710F95F6329AB66497C953F5342FC";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stories(),
                    Divider(),
                    PostComponent(),
                    PostComponent()
                  ],
                ),
              ),
            ),
            Divider(),
            CustomAppBar(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('')),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('')),
            BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), title: Text('')),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text(''))
          ]),
    );
  }
}

class PostComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 500,
      child: Column(
        children: <Widget>[
          PostTitle(),
          PostImage(
            img: imgPost,
          ),
          PostActions(),
          PostLikeDetails()
        ],
      ),
    );
  }
}

class PostTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(imgUrl),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'bill_gates_official',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            Icon(Icons.more_vert)
          ],
        ),
      ),
    );
  }
}

class PostImage extends StatelessWidget {
  var img = "";
  PostImage({this.img});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 300,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)),
    );
  }
}

class PostActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.favorite_border,
                ),
                Icon(
                  Icons.chat_bubble_outline,
                ),
                Icon(
                  Icons.send,
                ),
              ],
            ),
          ),
          Icon(Icons.save),
        ],
      ),
    );
  }
}

class PostLikeDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 30,
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 10,
            backgroundImage: NetworkImage(imgUrlSteveJobs),
          ),
          SizedBox(
            width: 10,
          ),
          Text('Curtido por steve_jobs_official e outras pessoas')
        ],
      ),
    );
  }
}

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          StoriesTopic(
            img: imgUrl,
            nome: 'Bill Gates',
          ),
          StoriesTopic(
            img: imgUrlSteveJobs,
            nome: 'Steve Jobs',
          ),
          StoriesTopic(
            img: imgUrl,
            nome: 'Bill Gates',
          )
        ],
      ),
    );
  }
}

class StoriesTopic extends StatelessWidget {
  var img = "";
  var nome = "";
  StoriesTopic({this.img, this.nome});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            nome,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      color: Colors.white,
      padding: EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Icon(Icons.camera_alt),
                SizedBox(
                  width: 20,
                ),
                Text('Instagram')
              ],
            ),
          ),
          Icon(Icons.send)
        ],
      ),
    );
  }
}
