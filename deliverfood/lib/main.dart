import 'package:flutter/material.dart';
import 'package:deliverfood/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){

  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
