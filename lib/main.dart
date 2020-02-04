import 'package:flutter/material.dart';
import 'package:lab_app/screens/wrapper.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Wrapper(),
      );
  }
}