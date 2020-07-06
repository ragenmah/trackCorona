import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:trackcorona/screens/covid19/buttom_nav_screen.dart';
import 'package:trackcorona/utils/constants.dart';
import 'package:trackcorona/utils/palette.dart';
import 'package:trackcorona/widgets/covid19/custom_appbar.dart';

class CoronaHomeScreen extends StatefulWidget {
  @override
  _CoronaHomeScreenState createState() => _CoronaHomeScreenState();
}

class _CoronaHomeScreenState extends State<CoronaHomeScreen> {
  // List homeData = CoronaHomeScreenData;
  String screenName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(titleName: ""),
      body: CustomScrollView(
        // padding: EdgeInsets.all(8),
        slivers: <Widget>[
          _buildHeader(),
          _buildNepalWebView(),
          _homeBodyContent(context)
        ],
      )
      // child: Column(
      //   children: <Widget>[
      //     _buildHeader(),
      //     _buildNepalWebView(),
      //     SizedBox(
      //       height: 20.0,
      //     ),
      //     _homeBodyContent()
      //   ],
      // ),
      ,
    );

    // CustomScrollView(
    //     semanticChildCount: 1,
    //     physics: ClampingScrollPhysics(),
    //     slivers: <Widget>[
    //       _buildHeader(),
    //       _buildNepalWebView(),
    //       _homeBodyContent()
    //     ]));
  }

  Widget _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: <Widget>[
            Text(
              'NEPAL',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network(
              "https://disease.sh/assets/img/flags/np.png",
              height: 25,
              width: 25,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String screenName) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      switch (screenName) {
        case "Podcasts":
          return BottomNavScreen(currentIndex: 7);
          break;
        case "FAQs":
          return BottomNavScreen(currentIndex: 8);
          break;
        case "Myths":
          return BottomNavScreen(currentIndex: 9);
          break;
        case "News":
          return BottomNavScreen(currentIndex: 10);
          break;

        default:
      }
      return BottomNavScreen(currentIndex: 7);
    }));
  }

  Widget _homeBodyContent(BuildContext context) {
    // var screensize = MediaQuery.of(context).size;

    // /*24 is for notification bar on Android*/
    // final double itemHeight = (screensize.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = screensize.width / 2;
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        // childAspectRatio: (itemWidth / itemHeight),
        // controller: new ScrollController(keepScrollOffset: false),
        // shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        children: coronaHomeScreenData
            .map((item) => GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             BottomNavScreen(currentIndex: 8)));
                    _navigateToScreen(context, item.values.first);
                  },
                  child: Card(
                    color: Colors.transparent,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(20.0),
                    //   // padding: const EdgeInsets.all(10.0),
                    // ),
                    elevation: 0,
                    child: GridTile(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(item.keys.first),
                              fit: BoxFit.fill),
                        ),
                      ),
                      footer: Container(
                        color: Colors.transparent.withOpacity(0.4),
                        padding: const EdgeInsets.all(8.0),
                        // margin: EdgeInsets.all(20.0),
                        child: Text(item.values.first,
                            style:
                                TextStyle(fontSize: 28, color: Colors.white)),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildNepalWebView() {
    const String html = """<!DOCTYPE html>
         <html>
         <head>
        <meta charset="UTF-8">
         <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
          <meta http-equiv="X-UA-Compatible" content="ie=edge"></head>
         <body>
         <iframe src="https://nepalcorona.info/embed/nepal-map"
         frameborder="0" style="width:100%;height:400;border:0px">
         </iframe></body></html>""";
    return Expanded(
      // padding: const EdgeInsets.all(10.0),
      child: SliverToBoxAdapter(
        child: HtmlWidget(
          html,
          webView: true,
        ),
      ),
    );
  }
}
