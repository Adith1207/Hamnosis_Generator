import 'package:flutter/material.dart';
import './homePage.dart';

void main(){
  runApp(const MyApp());
}

//This is the root of my application, The moment i load the page, this comes up
//Since stateless widgets, cannot be changed or transformed into something & is static

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  //mandatory have this overriding function
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


