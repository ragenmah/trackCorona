import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackcorona/screens/coronanews/news_detail_screen.dart';
import 'package:trackcorona/screens/myths/myths_detail_screen.dart';
import 'package:trackcorona/utils/palette.dart';

import 'package:trackcorona/viewmodels/news/news_list_view_model.dart';
import 'package:trackcorona/viewmodels/news/news_view_model.dart';
import 'package:trackcorona/widgets/covid19/custom_appbar.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsListViewModel>(context, listen: false).allNEWS();
  }

  Widget _buildList(NewsListViewModel clvm) {
    switch (clvm.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: listOfMyths(clvm.news),
        );
      case LoadingStatus.empty:
        return Center(
          child: Text("No results found"),
        );
      default:
        return Center(
          child: Text("No results found"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsListViewModel>(context, listen: true);
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(titleName: "News (समाचारहरु)"),
      body: _buildList(listViewModel),
    );
  }

  Widget listOfMyths(List<NewsViewModel> myths) {
    // List<HospitalViewModel> hospital;

    return ListView.builder(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          _showMythsDetailScreen(context, myths[index]);
        },
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10,
            child: Column(
              children: <Widget>[
                Image.network(myths[index].imageUrl),
                Container(
                  width: 300,
                  child: Padding(
                    padding: new EdgeInsets.only(right: 13.0),
                    child: Text(
                      myths[index].title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  child: Padding(
                    padding: new EdgeInsets.only(right: 20.0),
                    child: Text(
                      myths[index].summary,
                      textDirection: TextDirection.ltr,
                      // textAlign: TextAlign.left
                      // maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                      // softWrap: false,
                    ),
                  ),
                ),
                Text(
                  " via: ${myths[index].sourceName}",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            )),
      ),
      itemCount: myths.length,
    );
  }

  void _showMythsDetailScreen(BuildContext context, NewsViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsDetailScreen(
        news: vm,
      );
    }));
  }
}
