import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'De película',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Catálogo dominguero'),
        ),
        body: Stack(children:[
          Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/pop.jpg'),
                fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),
                BlendMode.srcOver) )),
          ),
          Center(
            child: Text('Bienvenido', style: TextStyle(color: Colors.white, fontSize: 50),),
          ),
          Container(
            child: Icon(
              Icons.beenhere,
              color: Colors.yellow[500],
                size: 50.0
            ),
          )
        ])
      ),
    );
  }
}