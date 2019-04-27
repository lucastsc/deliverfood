import 'package:flutter/material.dart';
class Product{
  String name;
  String description;

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