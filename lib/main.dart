import 'package:flames_app/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 137, 176),
          title: Text("FLAMES",style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: const homepage()
        ),
      ),
    );
  }
}
