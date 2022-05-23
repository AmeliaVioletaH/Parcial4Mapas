import 'package:flutter/material.dart';
import 'package:flutter_geoo/app/ui/pages/home/home_page.dart';

void main() {
  runApp(const MapaGoogle());
}

class MapaGoogle extends StatelessWidget {
  const MapaGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcial 4 - Violeta Hernández',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
