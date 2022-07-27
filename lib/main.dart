import 'package:flutter/material.dart';
import 'package:starter_app/NoteApp.dart';
import 'package:starter_app/calculator_screen.dart';
import 'package:starter_app/home_screen.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoteApp(),
    );
  }


}
