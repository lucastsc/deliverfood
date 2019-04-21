import 'package:flutter/material.dart';
import 'helper/firebaseHelper.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: (){
              emailController.text = "";
              passwordController.text = "";
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email here",
              ),
            ),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password here",
              ),
            ),

            RaisedButton(
              color: Colors.blue,
              child: Text("Sign Up"),
              onPressed: (){
                firebaseHelper().signInWithEmail(context,emailController.text, passwordController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
