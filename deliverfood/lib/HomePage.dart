import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'RegisterFood.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'SignUp.dart';
import 'SignIn.dart';
import 'helper/firebaseHelper.dart';
import 'helper/helpFunctions.dart';


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
            icon: Icon(Icons.person_outline),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
            },
          ),

          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
            },
          ),

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

                firebaseHelper().getCurrentUser().then((result){//gets the current logged user

                  if(result != null){//if there is a logged in user, then
                    print("There is a logged in user with uid: " + result);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterFood()));
                  }else{
                    print("You need to log in first");
                  }


                });

              },
            ),

            RaisedButton(
              color: Colors.lightBlue,
              child: Text("SignOut"),
              onPressed: (){
                firebaseHelper().signUserOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
