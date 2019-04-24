import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'RegisteredFoodsList.dart';
import 'helper/firebaseHelper.dart';
import 'helper/helpFunctions.dart';

class RegisterFood extends StatefulWidget {
  @override
  _RegisterFoodState createState() => _RegisterFoodState();
}

class _RegisterFoodState extends State<RegisterFood> {

  TextEditingController foodNameController = new TextEditingController();
  TextEditingController foodDescriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("RegisterFood"),
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context) => RegisteredFoodsList()));
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisteredFoodsList()));
            },
          )
        ],
      ),

      body: Container(
        child: Column(
          children: <Widget>[

            TextField(
              controller: foodNameController,
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "Enter the food's name"
              ),
            ),

            TextField(
              controller: foodDescriptionController,
              decoration: InputDecoration(
                labelText: "Description",
                hintText: "Enter food's description"
              ),
            ),

            RaisedButton(
              color: Colors.lightBlue,
              child: Text("Register in Firebase"),
              onPressed: (){

              String foodName = foodNameController.text;
              String foodDescription = foodDescriptionController.text;

                if(foodNameController.text != "" && foodDescriptionController.text != ""){
                  Firestore.instance.collection("registeredFoods").document(foodName).setData({"name":foodName,"description":foodDescription});
                  helpFunctions().myShowDialog(context, "Alert", "Food registered in Firebase");
                }

                setState(() { //refreshes the fields after pressing the register button
                  foodNameController.text = "";
                  foodDescriptionController.text = "";
                });

              },
            ),

          ],
        ),
      ),
    );
  }
}
