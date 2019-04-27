import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget buildDrawerBack(){
      return Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey
        ),
      );
    }

    return Drawer(
      child: Stack(
        children: <Widget>[
          buildDrawerBack()
        ],
      ),
    );

  }
}
