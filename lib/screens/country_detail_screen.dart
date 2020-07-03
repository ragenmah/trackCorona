import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trackcorona/utils/constants.dart';
import 'package:trackcorona/viewmodels/country_view_model.dart';
import 'package:trackcorona/widgets/circular_image.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:websafe_svg/websafe_svg.dart';

class CountryDetailScreen extends StatefulWidget {
  final CountryViewModel country;
  CountryDetailScreen({@required this.country});

  @override
  _CountryDetailScreenState createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  Completer<GoogleMapController> _controller = Completer();

  MapType myMapType = MapType.normal;

  String mapsType = "normal";
  @override
  Widget build(BuildContext context) {
    // final Map country = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 24.0,
              // backgroundImage: NetworkImage(this.widget.country.countryflag),
              child: CircularImage(
                imageUrl: this.widget.country.countryflag,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 150,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text(
                  //   'Country',
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //     fontSize: 12,
                  //   ),
                  // ),
                  Text(
                    this.widget.country.name ?? 'Undefined',
                    // overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Stack(
                //   alignment: Alignment.centerLeft,
                //   children: <Widget>[
                //     Divider(
                //       height: 80,
                //       color: Color(0xffFF8A30),
                //       thickness: 20,
                //     ),
                //     Text(
                //       ' Country',
                //       style: TextStyle(
                //         fontSize: 14,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
                Text(
                  "Country Name:${this.widget.country.name}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    wordSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Capital: ${this.widget.country.capital}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Map of ${this.widget.country.name}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 200,
                  child: CircularImage(
                    imageUrl: this.widget.country.countryflag,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Native Name: ${this.widget.country.nativeName ?? "No Native Name"}",
                  style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Population ${this.widget.country.population.toString() ?? "0"}",
                  style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 3,
                  ),
                ),
                // Text(
                //     "${this.country.latitudelng} and ${this.country.latitudelng[0]} and ${this.country.latitudelng[1]} "),
                // PopupMenuButton<String>(
                //   onSelected: (value) {
                //     // _selectCountry(vs, value);
                //   },
                //   icon: Icon(Icons.more_vert),
                //   itemBuilder: (_) {
                //     return Constants.mapType
                //         .map((v) => PopupMenuItem(
                //               value: v,
                //               child: Text(v),
                //             ))
                //         .toList();
                //   },
                // ),
                DropdownButton<String>(
                  value: mapsType,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      mapsType = newValue;
                    });
                    changeMap(newValue);
                  },
                  items: Constants.mapType
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Location of ${this.widget.country.name}",
                  style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 3,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    mapType: myMapType,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(this.widget.country.latitudelng[0],
                          this.widget.country.latitudelng[1]),
                      zoom: 6,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeMap(String ddvalue) {
    switch (ddvalue) {
      case "satellite":
        // print("satellite");
        setState(() {
          myMapType = MapType.satellite;
        });
        // return MapType.satellite;
        return;
      case "hybrid":
        setState(() {
          myMapType = MapType.hybrid;
        });
        return;
      case "normal":
        setState(() {
          myMapType = MapType.normal;
        });
        return;
      case "terrain":
        setState(() {
          myMapType = MapType.terrain;
        });
        return;
      default:
        setState(() {
          myMapType = MapType.normal;
        });
        return;
    }
  }
}
