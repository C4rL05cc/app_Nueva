import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  Future getClimaData() async {
    var response = await http.get(Uri.https('api.openweathermap.org', 'data/2.5/weather?lat=19.7006&lon=-101.186&appid=142d1704a7fe78086941fe6355ac1b6c'));
    var jsonData = jsonDecode(response.body);
    List<Clima> climas = [];

    for(var c in jsonData){
      Clima clima = Clima(c["name"], c["sys"], c["weather"]);
      climas.add(clima);
    }
    print(climas.length);
    return climas;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Container(
          child: Card(
            child: FutureBuilder(
            future: getClimaData(),
            builder: (context, snapshot){
              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: Text('Cargando'),
                  ),
                );
              } else
                return ListView.builder(
                  itemCount: (snapshot.data as dynamic).length,
                  itemBuilder: (context, i){
                return ListTile(
                  title: Text(snapshot.data[i].name),
                  );
              });
            },
          ),
            ),
        )
      ),
    );
  }
}

class Clima {
  final String name, sys, weather;
  Clima(this.name, this.sys, this.weather);
}