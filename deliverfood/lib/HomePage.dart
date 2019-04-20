import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deliverfood"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              child: Text("Firebase"),
              onPressed: (){
                Firestore.instance.collection("teste2").document("teste2").setData({"teste1":"teste2"});
              },
            )
          ],
        ),
      ),
    );
  }
}
