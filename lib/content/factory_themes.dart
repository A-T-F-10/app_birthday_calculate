import 'package:flutter/material.dart';
class Factory{
  static ThemeData lightTheme(){
    return  ThemeData(
     primarySwatch: Colors.deepPurple,
      primaryColor:Colors.deepPurple,

    );
  }


  static ThemeData darkTheme(){
  return ThemeData(
   brightness: Brightness.dark,
    accentColor: Colors.deepPurple,
    primaryColor:Colors.deepPurple,
    primarySwatch: Colors.deepPurple,
    // buttonColor: Colors.white,
    // buttonTheme: ButtonThemeData(buttonColor: Colors.amber),

  );
  }
}