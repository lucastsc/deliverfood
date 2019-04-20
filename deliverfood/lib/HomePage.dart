import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'RegisterFood.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'SignUp.dart';


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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            RaisedButton(
              color: Colors.blue,
              child: Text("Register Food"),
              onPressed: (){
                //Firestore.instance.collection("users").document("novapessoa").setData({"nome":"Joao","idade":"30"});
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterFood()));
              },
            )
          ],
        ),
      ),
    );
  }
}
