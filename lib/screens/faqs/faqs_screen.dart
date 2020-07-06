import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackcorona/viewmodels/faqs/faqs_list_view_model.dart';
import 'package:trackcorona/viewmodels/faqs/faqs_view_model.dart';
import 'package:trackcorona/widgets/covid19/custom_appbar.dart';

class FAQsScreen extends StatefulWidget {
  @override
  _FAQsScreenState createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FAQSListViewModel>(context, listen: false).allFAQS();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<FAQSListViewModel>(context, listen: true);

    return Scaffold(
      appBar: CustomAppBar(
        titleName: "FAQs",
      ),
      body: _buildExpandableList(listViewModel),
      //  CustomScrollView(
      //     physics: ClampingScrollPhysics(),
      //     slivers: <Widget>[
      //       _buildHeader(),

      //     ]),
    );
  }

  Widget _buildExpandableList(FAQSListViewModel clvm) {
    switch (clvm.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: listOfFAQS(clvm.faqs),
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

  Widget listOfFAQS(List<FAQSViewModel> faqs) {
    return Container(
      child: Column(
        children: <Widget>[
          // _buildHeader(),
          Container(
            height: 500,
            child: ListView.builder(
              itemCount: faqs.length,
              itemBuilder: (context, index) => ExpansionTile(
                title: Text(
                  faqs[index].question,
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                children: <Widget>[
                  Text(
                    faqs[index].answer,
                    style: new TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      // height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'FAQS',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
