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
      title: 'LDSW',
      home: Scaffold(
             body: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Container(
                   color: Colors.blueAccent,
                   padding: EdgeInsets.all(30),
                   child: Row(
                     children: [
                       Text('Actividad 3.4', style: TextStyle(
                         fontSize: 40,
                         color: Colors.white
                       )),
                     ],
                   ),
                 ),
                 Container(
                   color: Colors.lightBlue,
                   padding: EdgeInsets.all(15),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('Utilización de widgets', style: TextStyle(
                           fontSize: 20,
                           color: Colors.white
                       )),
                     ],
                   ),
                 ),
                 Stack(
                   alignment: Alignment.topCenter,
                   children: [
                     Container(
                       color: Colors.amber,
                       child: SizedBox(
                         height: 150,
                         width: 150,
                       ),
                     ),
                     Container(
                       color: Colors.blueGrey,
                       child: SizedBox(
                         height: 60,
                         width: 60,
                       ),
                     )
                   ],
                 )
               ],
             ),
      ),
    );
  }
}