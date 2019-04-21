import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class firebaseHelper{
  final FirebaseAuth _auth = FirebaseAuth.instance;

void signUpWithEmail(BuildContext context,String email, String password) async{
  FirebaseUser user;
  try{
    user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,);
  }catch(e){
    print(e.toString());
  }finally{
    if(user != null){
      //sign in successfull
      //ex: bring the user to the home page
      myShowDialog(context, "Alert", "Sign Up successfull");
    }else{
      //sign in unsuccessfull
      //ex: prompt the user to try again
      myShowDialog(context, "Alert", "Sign Up failed");
    }
  }
}

void signInWithEmail(BuildContext context,String email, String password) async{
  FirebaseUser user;
  try{
    user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
  }catch(e){
    print(e.toString());
  }finally{
    if(user != null){
      //sign in successfull
      //ex: bring the user to the home page
      myShowDialog(context, "Alert", "Signing In Successfull");
    }else{
      //sign in unsuccessfull
      //ex: prompt the user to try again
      myShowDialog(context, "Alert", "Failed to Sign In");
    }
  }
}

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

