import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_app/weather.dart';

void main()=> runApp(MaterialApp(
  title: "Clima de ciudad",
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var url = "https://api.openweathermap.org/data/2.5/weather?lat=19.7006&lon=-101.186&appid=142d1704a7fe78086941fe6355ac1b6c";

  ClimaHoy? climaHoy;


  @override
  void initState() {
        super.initState();

        fetchData();
   //     print("hola");
  }

  fetchData() async {
    var res = await http.get(Uri.parse(url));
    var decodedJson = jsonDecode(res.body);

    climaHoy = ClimaHoy.fromJson(decodedJson);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("El clima de mi ciudad, hoy"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: climaHoy.weather.map((e) => null),
      ),
    );
  }
}
