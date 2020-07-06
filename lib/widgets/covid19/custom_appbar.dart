import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trackcorona/utils/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String titleName;

  CustomAppBar({Key key, this.titleName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        IconButton(
          icon: const Icon(Icons.notifications_none),
          iconSize: 28.0,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
