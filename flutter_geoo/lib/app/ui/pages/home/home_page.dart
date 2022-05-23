// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _initialCameraPosition =
      const CameraPosition(target: LatLng(13.831604, -89.270310), zoom: 10.5);

  final ubicaciones = [
    {
      "id": "ciudad_arce_1",
      "lat": 13.854797,
      "lng": -89.453690,
      "nombre": "Ciudad Arce Centro",
      "desc": "Ciudad Arce es una Ciudad y municipio ubicado en el departamento de la Libertad, El Salvador."
    },
    {
      "id": "salvador_del_mundo_1",
      "lat": 13.702236,
      "lng": -89.223395,
      "nombre": "Salvador del Mundo",
      "desc": "La Plaza Salvador del Mundo se encuentra ubicada en la ciudad de San Salvador, El Salvador."
    },
    {
      "id": "soyapango_centro_1",
      "lat": 13.716382,
      "lng": -89.139535,
      "nombre": "Soyapango Centro",
      "desc": "Ubicado al centro del departamento y Área Metropolitana de San Salvador, la capital del país."
    },
    {
      "id": "san_jacinto_1",
      "lat": 13.685898,
      "lng": -89.188600,
      "nombre": "San Jacinto Centro",
      "desc": "Barrio San Jacinto se encuentra en el el este de la región San Salvador."
    },
    {
      "id": "centro_san_salvador_1",
      "lat": 13.699654,
      "lng": -89.105523,
      "nombre": "Centro de San Salvador",
      "desc": "Donde se inició la expansión de la ciudad capital de El Salvador desde el siglo XVI."
    }
  ];

  String _selectedLocation = '';

  Iterable<Marker> _buildMarkers() {
    return ubicaciones.map((office) {
      return Marker(
          markerId: MarkerId(office['id'].toString()),
          position: LatLng(double.parse(office['lat'].toString()),
              double.parse(office['lng'].toString())),
          infoWindow: InfoWindow(
            title: office['nombre'].toString(),
            snippet: office['desc'].toString(),
          ),
          icon: office['id'] == _selectedLocation
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)
              : BitmapDescriptor.defaultMarker,
          consumeTapEvents: false,
          onTap: () {
            setState(() {
              _selectedLocation = office['id'].toString();
            });
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubicación de sucursales - Empresa Movil SV"),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: _buildMarkers().toSet(),
      ),
    );
  }
}
