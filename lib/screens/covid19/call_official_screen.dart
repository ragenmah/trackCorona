import 'package:flutter/material.dart';
// import 'package:trackcorona/screens/covid19/buttom_nav_screen.dart';
// import 'package:trackcorona/screens/covid19/homepage.dart';
import 'package:trackcorona/utils/constants.dart';
import 'package:trackcorona/utils/palette.dart';
import 'package:trackcorona/widgets/covid19/custom_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class CallOfficialsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(titleName: "Official Number"),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        // shrinkWrap: true,
        // scrollDirection: Axis.horizontal,

        slivers: <Widget>[
          // _buildHeader(screenHeight),
          // _buildPreventionTips(screenHeight),
          // _buildYourOwnTest(screenHeight),
          // _buildSymptoms(screenHeight),
          SliverToBoxAdapter(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.blueAccent,
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Card(
                        color: Colors.lightBlueAccent,
                        child: Text(
                          "For more information on COVID-19 from the Ministry of Health and Population:  ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.blueAccent,
                        child: Column(
                          children: <Widget>[
                            Text(
                              " -Call the hotlines at 1115 and 1133 from 6 AM to 10 PM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              "  -Call 9851255839, 9851255837, 9851255834 from 8 AM to 8 PM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              " - Search for MoHP Nepal COVID-19 on Viber to join the Ministry's community",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              "Or get WHO health alerts on WhatsApp by textin 'Hi' to +41 79 8931892",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          // shrinkWrap: true,
                          // scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (context, index) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: officialNumbers
                                .map(
                                  (e) => ListTile(
                                    title: Text(e.keys.first),
                                    onTap: () {
                                      launch("tel://${e.values.first ?? "0"}");
                                    },
                                    subtitle: Text(e.values.first),
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.green,
                                      child: Text(e.keys.first[0],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                          )),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
