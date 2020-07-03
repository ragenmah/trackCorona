import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackcorona/screens/country_screen.dart';
import 'package:trackcorona/screens/covid19/buttom_nav_screen.dart';
import 'package:trackcorona/screens/covid19/homepage.dart';
import 'package:trackcorona/screens/google_map.dart';
import 'package:trackcorona/viewmodels/country_list_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track-Corona',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNavScreen(currentIndex: 0),
    );
  }
}
