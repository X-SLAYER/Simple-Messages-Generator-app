import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _messages = new List();
  List<String> _senderMessages = new List();
  List<String> _randomMessages = [
    "Hello",
    "bnj",
    "Hmdll et toi ?"
    "Hi , What are you doind hhh ??",
    "Hello How Are You",
    "Lorem consectetur dolor quis id excepteur reprehenderit ut consequat nisi magna ullamco nulla duis. Nostrud magna et elit nisi ad eu cillum proident laboris ipsum. Commodo sint non dolore labore. Mollit et voluptate deserunt et ipsum sunt ex dolor magna et. Ad et quis nisi mollit dolore voluptate cupidatat occaecat Lorem. Incididunt do cillum eiusmod consectetur Lorem minim ullamco non. Culpa cupidatat cupidatat incididunt esse commodo id laborum aute dolore ea ullamco."
        "Cillum dolor magna mollit elit irure id eiusmod cillum."
        "Thanks ",
    "Nice To Meet You"
  ];
  var rnd = new Random();
  TextEditingController _txt = new TextEditingController();

  void _addMessages(String msg , String randommsg) {
    if (msg.isEmpty) {
      return;
    }
    setState(() {
      _messages.add(msg);
      _senderMessages.add(randommsg);
      _txt.clear();
    });
  }

  Widget _messageBox(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(25.0)),
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15),
      child: Container(
        padding: EdgeInsets.all(11.0),
        child: Text(
          _messages[index],
          style: TextStyle(color: Colors.white),
        ),
        width: MediaQuery.of(context).size.width * 0.78,
      ),
    );
  }

  Widget _senderMessageBox(int index) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://articles-images.sftcdn.net/wp-content/uploads/sites/3/2016/01/wallpaper-for-facebook-profile-photo.jpg'),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(25.0)),
          margin:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.15),
          child: Container(
            padding: EdgeInsets.all(11.0),
            child: Text(
              _senderMessages[index],
              style: TextStyle(color: Colors.white),
            ),
            width: MediaQuery.of(context).size.width * 0.78,
          ),
        ),
      ],
    );
  }

  Widget _bottomNavigation() {
    return Container(
      height: 55.0,
      color: Colors.white24,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  _messages.clear();
                });
              },
              icon: Icon(Icons.clear),
              color: Colors.black,
            ),
            SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: _txt,
                  decoration: InputDecoration(
                      hintText: "Type a Message ...", border: InputBorder.none),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _addMessages(_txt.text , _randomMessages[rnd.nextInt(_randomMessages.length)]);
              },
              icon: Icon(
                Icons.send,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Messages',
        ),
        leading: Icon(Icons.message),
      ),
      body: Container(
        child: ListView.builder(
          reverse: true,
          itemCount: _messages.length == 0 ? 0 : _messages.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: <Widget>[
                  _senderMessageBox(index),
                  SizedBox(
                    height: 8.0,
                  ),
                  _messageBox(index),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }
}
