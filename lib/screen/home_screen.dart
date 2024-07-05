// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: GoogleFonts.ubuntu(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(10, 40, 116, 1)),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final Image image;
  final String label;
  final VoidCallback onPressed;

  CategoryButton({required this.image, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.blue[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.all(20),
            side: BorderSide(color: Colors.blue, width: 2),
          ),
          child: Column(
            children: [
              image,
              SizedBox(height: 8),
              Text(label, style: TextStyle(fontSize: 20, color: Colors.blue)),
            ],
          ),
        ),
      ],
    );
  }
}


