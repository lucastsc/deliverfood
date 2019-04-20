import 'package:flutter/material.dart';
import 'helper/firebaseHelper.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                firebaseHelper().signUpWithEmail(emailController.text, passwordController.text);
              },
            ),
          ],

        ),
      ),
    );
  }
}
