import 'package:flutter/material.dart';
class Product{
  String name;
  String description;
  String cid;//product documentID on firebase

  /*constructor*/
  Product(String name, String description){
    this.name = name;
    this.description = description;
  }

  Map<String,dynamic> toMap(){
    return{
      "name":name,
      "description":description
    };
  }
}