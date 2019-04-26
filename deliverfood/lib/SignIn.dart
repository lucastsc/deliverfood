import 'package:deliverfood/HomePage.dart';
import 'package:deliverfood/SignUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'helper/firebaseHelper.dart';
import 'helper/helpFunctions.dart';

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

            Container(
              margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              /*decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all()
              ),*/
            ),

            registerLink(context),

            RaisedButton(
              color: Colors.blue,
              child: Text("Sign In"),
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

Widget registerLink(BuildContext context){
  return Center(
    child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account?",
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: " Create one",
              style: TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                  //helpFunctions().myShowDialog(context, "Warning", "Tapped the text!");
                }
            )
          ]
        )
    ),
  );
}
