import 'package:flutter/material.dart';

class helpFunctions{

  void myShowDialog(BuildContext context,String title, String message){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }

}