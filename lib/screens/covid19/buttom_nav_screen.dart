import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackcorona/screens/covid19/homepage.dart';

import 'package:trackcorona/screens/covid19/stats_screen.dart';
import 'package:trackcorona/screens/hospitals/hospital_list_screen.dart';
import 'package:trackcorona/screens/nepalicorona/corona_home_screen.dart';
import 'package:trackcorona/screens/podcasts/podcasts_screen.dart';
import 'package:trackcorona/viewmodels/corona/corona_list_view_model.dart';
import 'package:trackcorona/viewmodels/country_list_view_model.dart';
import 'package:trackcorona/viewmodels/hospital/hospital_list_view_model.dart';
import 'package:trackcorona/utils/palette.dart';
import 'package:trackcorona/viewmodels/podcasts/podcasts_list_view_model.dart';
import '../country_screen.dart';
import 'call_official_screen.dart';

class BottomNavScreen extends StatefulWidget {
  final int currentIndex;
  // BottomNavScreen(this.currentIndex);

  BottomNavScreen({Key key, @required this.currentIndex}) : super(key: key);
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    HomePage(),
    StatsScreen(),
    CountryScreen(),
    CoronaHomeScreen(),
    Scaffold(),
    CallOfficialsScreen(),
    HospitalList(),
    PodcastsScreen(),
    // CoronaHomePage()
  ];
  // int widget.currentIndex
  int _currentIn = 0;
// BottomNavScreen(this.)
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIn = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountryListViewModel()),
          ChangeNotifierProvider(create: (_) => HospitalListViewModel()),
          ChangeNotifierProvider(create: (_) => CoronaListViewModel()),
          ChangeNotifierProvider(create: (_) => PodcastsListViewModel()),
        ],
        // child: CountryMap(),
        // child: HomePage(),
        child: _screens[_currentIn],
        // child: CountryScreen(),//home screen for countries
      ),

      // _screens[widget.currentIndex != 0 ? widget.currentIndex : _currentIn],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIn > 4 ? 0 : _currentIn,
        onTap: (index) => setState(() => _currentIn = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Palette.primaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home, Icons.insert_chart, Icons.event_note, Icons.info]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    title: Text(''),
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIn == key
                            ? Colors.blue[600]
                            : Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
