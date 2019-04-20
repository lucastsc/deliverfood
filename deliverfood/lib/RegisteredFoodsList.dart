import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisteredFoodsList extends StatefulWidget {
  @override
  _RegisteredFoodsListState createState() => _RegisteredFoodsListState();
}

class _RegisteredFoodsListState extends State<RegisteredFoodsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RegisteredFoodsList"),
      ),

      body: StreamBuilder<QuerySnapshot>(//recover data from firebase and shows in the listview
        stream: Firestore.instance.collection('registeredFoods').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return new Text('Loading...');
            default:
              return new ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  return new ListTile(
                    title: new Text(document['name']),
                    subtitle: new Text(document['description'].toString()),
                  );
                }).toList(),
              );
          }
        },
      )

    );
  }
}
