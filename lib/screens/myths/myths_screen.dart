import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackcorona/screens/myths/myths_detail_screen.dart';
import 'package:trackcorona/utils/palette.dart';
import 'package:trackcorona/utils/styles.dart';

import 'package:trackcorona/viewmodels/myths/myths_list_view_model.dart';
import 'package:trackcorona/viewmodels/myths/myths_view_model.dart';
import 'package:trackcorona/widgets/covid19/custom_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class MythScreen extends StatefulWidget {
  @override
  _MythScreenState createState() => _MythScreenState();
}

class _MythScreenState extends State<MythScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MythsListViewModel>(context, listen: false).allMyths();
  }

  Widget _buildList(MythsListViewModel clvm) {
    switch (clvm.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: listOfMyths(clvm.myths),
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
    var listViewModel = Provider.of<MythsListViewModel>(context, listen: true);
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(titleName: "Myths (भ्रम)"),
      body: _buildList(listViewModel),
    );
  }

  Widget listOfMyths(List<MythsViewModel> myths) {
    // List<HospitalViewModel> hospital;

    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }
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
                  ],
                )),
          ),
          itemCount: myths.length,
        );
      },
      future:
          Provider.of<MythsListViewModel>(context, listen: false).allMyths(),
    );
  }

  void _showMythsDetailScreen(BuildContext context, MythsViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return MythsDetailScreen(
        myths: vm,
      );
    }));
  }
}
