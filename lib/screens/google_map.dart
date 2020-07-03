import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CountryMap extends StatefulWidget {
  @override
  _CountryMapState createState() => _CountryMapState();
}

class _CountryMapState extends State<CountryMap> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    // final Map country = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Afganistan'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(33.0, 65.0),
          zoom: 6,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
