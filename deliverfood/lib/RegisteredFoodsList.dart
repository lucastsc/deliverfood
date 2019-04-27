import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverfood/FoodCart.dart';
import 'package:deliverfood/helper/product.dart';
import 'package:flutter/material.dart';
import 'helper/firebaseHelper.dart';

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FoodCart()));
            },
          )
        ],
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
                  return foodCard(document['name'],document['description']);
                }).toList(),
              );
          }
        },
      )

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

                    Product food = Product(foodName, foodDescription);

                    firebaseHelper().getCurrentUser().then((result){
                      /*Firestore.instance.collection(result).document(foodName).setData({"name":foodName,"description":foodDescription});*/
                      Firestore.instance.collection("users").document(result).collection("cart").add(food.toMap());


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

