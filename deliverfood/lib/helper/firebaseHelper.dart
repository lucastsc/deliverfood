import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class firebaseHelper{
  final FirebaseAuth _auth = FirebaseAuth.instance;

void signUpWithEmail(String email, String password) async{
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
    }else{
      //sign in unsuccessfull
      //ex: prompt the user to try again
    }
  }
}

}

