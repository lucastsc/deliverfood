import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverfood/helper/firebaseHelper.dart';
import 'package:flutter/material.dart';

class FoodCart extends StatefulWidget {
  @override
  _FoodCartState createState() => _FoodCartState();
}

class _FoodCartState extends State<FoodCart> {

  @override
  Widget build(BuildContext context) {

    String currentUser;
    firebaseHelper().getCurrentUser().then((result){
        currentUser = result;
    });

    print(currentUser);
    return Scaffold(
      appBar: AppBar(
        title: Text("FoodCart"),
        backgroundColor: Colors.lightBlue,
      ),
      body: StreamBuilder<QuerySnapshot>(//recover data from firebase and shows in the listview
        stream: Firestore.instance.collection("registeredFoods").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return new Text('Loading...');
            default:
              return new ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  return foodCard(document['name'],document['description']);
                }).toList(),
              );
          }
        },
      ),
    );
  }
}

Widget foodCard(String foodName, String foodDescription){
  return Card(

      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //mainAxisSize: MainAxisSize.max,

        children: <Widget>[

          Padding(
            padding: EdgeInsets.all(40.0),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[

                Expanded(//inserted expanded because if the description is too long, it breaks the line
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,//make text alignment from start
                    children: <Widget>[
                      Text(foodName,style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(foodDescription)
                    ],
                  ),
                ),

                RaisedButton(
                  color: Colors.lightBlue,
                  child: Text("Order"),
                  onPressed: (){
                    print(foodName);
                    firebaseHelper().getCurrentUser().then((result){
                      Firestore.instance.collection(result).document(foodName).setData({"name":foodName,"description":foodDescription});
                    });
                  },
                ),

              ],
            ),
          )


        ],
      )
  );
}
