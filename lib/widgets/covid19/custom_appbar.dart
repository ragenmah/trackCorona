import 'dart:math';

import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:trackcorona/screens/covid19/stats_screen.dart';
import 'package:trackcorona/screens/nepalicorona/corona_home_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String titleName;

  CustomAppBar({Key key, this.titleName}) : super(key: key);
  // final int _currentIndex = 0;
  // final List<Widget> _pages = [StatsScreen(), CoronaHomeScreen()];
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: AppBar(
        backgroundColor:
            Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        //  Palette.primaryColor,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 28.0,
          onPressed: () {},
        ),
        title: Text(titleName),
        actions: <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.notifications_none),
          //   iconSize: 28.0,
          //   onPressed: () {},
          // ),
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],
      ),
      stickyFrontLayer: true,
      // frontLayer: _pages[_currentIndex],
      // backLayer: BackdropNavigationBackLayer(
      //   items: [
      //     ListTile(title: Text("Widget 1")),
      //     ListTile(title: Text("Widget 2")),
      //   ],
      //   // onTap: (int position) => {setState(() => _currentIndex = position)},
      // ),

      backLayer: Center(
        child: Text("Back Layer"),
      ),
      subHeader: BackdropSubHeader(
        title: Text("Sub Header"),
      ),
      frontLayer: Center(
        child: Text("Front Layer"),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
