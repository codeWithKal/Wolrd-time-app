import 'package:flutter/material.dart';
import 'package:world_app/pages/Home.dart';
import 'package:world_app/pages/Loading.dart';
import 'package:world_app/pages/chooseLocation.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes:
    {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/location" : (context) => ChooseLocation(),
    },

  ));
}
