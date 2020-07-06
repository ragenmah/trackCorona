import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trackcorona/screens/covid19/buttom_nav_screen.dart';
import 'package:trackcorona/screens/covid19/call_official_screen.dart';
import 'package:trackcorona/widgets/covid19/custom_appbar.dart';
import 'package:trackcorona/utils/styles.dart';
import 'package:trackcorona/utils/palette.dart';
import 'package:trackcorona/utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        titleName: " ",
      ),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        // scrollDirection: Axis.horizontal,

        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildSymptoms(screenHeight),
          _buildYourOwnTest(screenHeight),
          _buildPreventionTips(screenHeight),
        ],
      ),
    );
  }

// https://nepalcorona.info/data/api
  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'COVID-19',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // CountryDropdown(
                //   countries: ['CN', 'FR', 'IN', 'IT', 'UK', 'USA'],
                //   country: _country,
                //   onChanged: (val) => setState(() => _country = val),
                // ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Are you feeling sick?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'If you feel sick with any COVID-19 symptoms, please call or text us immediately for help',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BottomNavScreen(currentIndex: 5)));
                      },
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Call Now',
                        style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BottomNavScreen(currentIndex: 6)));
                      },
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        Icons.history,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Hospitals',
                        style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
  //   return SliverToBoxAdapter(
  //     child: Container(
  //       padding: const EdgeInsets.all(20.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           Text(
  //             'Prevention Tips',
  //             style: const TextStyle(
  //               fontSize: 22.0,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //           const SizedBox(height: 20.0),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: prevention
  //                 .map((e) => Column(
  //                       children: <Widget>[
  //                         Image.asset(
  //                           e.keys.first,
  //                           height: screenHeight * 0.12,
  //                         ),
  //                         SizedBox(height: screenHeight * 0.015),
  //                         Text(
  //                           e.values.first,
  //                           style: const TextStyle(
  //                             fontSize: 16.0,
  //                             fontWeight: FontWeight.w500,
  //                           ),
  //                           textAlign: TextAlign.center,
  //                         )
  //                       ],
  //                     ))
  //                 .toList(),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Prevention Tips',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 580,
              child: ListView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                itemCount: prevention.length,
                padding: const EdgeInsets.all(10.0),
                itemBuilder: (context, index) => Container(
                  // color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                  //     .withOpacity(1.0),
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset(
                          prevention[index].keys.first, width: 100,
                          height: 100,

                          // fit: BoxFit.cover,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          prevention[index].values.first,
                          style: const TextStyle(
                            // color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('assets/corona_images/own_test.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Do your own test!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Follow the instructions\nto do your own test.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildSymptoms(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Symptoms',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: symptoms
                  .map((e) => Column(
                        children: <Widget>[
                          Image.asset(
                            e.keys.first,
                            height: screenHeight * 0.12,
                          ),
                          // SizedBox(height: screenHeight * 0.015),
                          Text(
                            e.values.first,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
