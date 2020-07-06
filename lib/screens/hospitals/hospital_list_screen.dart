import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackcorona/utils/palette.dart';
import 'package:trackcorona/utils/styles.dart';
import 'package:trackcorona/viewmodels/hospital/hospital_list_view_model.dart';
import 'package:trackcorona/viewmodels/hospital/hospital_view_model.dart';
import 'package:trackcorona/widgets/covid19/custom_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  @override
  void initState() {
    super.initState();
    Provider.of<HospitalListViewModel>(context, listen: false).allHospitals();
  }

  Widget _buildList(HospitalListViewModel clvm) {
    switch (clvm.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: listOfHospital(clvm.hospitals),
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
    var listViewModel =
        Provider.of<HospitalListViewModel>(context, listen: true);
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(titleName: "Hospital list"),
      body: _buildList(listViewModel),
    );
  }

  Widget listOfHospital(List<HospitalViewModel> hospitals) {
    // List<HospitalViewModel> hospital;
    return ListView.builder(
      itemBuilder: (context, index) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: hospitals[index].imageUrl == ""
                  ? Image.asset(
                      'assets/corona_images/hospital.png',
                      width: 120.0,
                      height: 120.0,
                      fit: BoxFit.fill,
                    )
                  : Image.network(hospitals[index].imageUrl),
              title: Text(
                hospitals[index].hospitalName,
                style: TextStyle(color: Colors.deepPurple),
                // textAlign: TextAlign.left,
              ),
              subtitle: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    hospitals[index].address,
                    style: TextStyle(color: Colors.deepPurple),
                    // textAlign: TextAlign.left,
                  ),
                  Text(
                    hospitals[index].contactPerson ?? "",
                    style: TextStyle(color: Colors.deepPurple),
                    // textAlign: TextAlign.left,
                  ),
                  Text(
                    hospitals[index].contactPersonNumber ?? "",
                    style: TextStyle(color: Colors.deepPurple),
                    // textAlign: TextAlign.left,
                  ),
                  Text(
                    hospitals[index].email ?? "",
                    style: TextStyle(color: Colors.deepPurple),
                    // textAlign: TextAlign.left,
                  ),
                  Text(
                    hospitals[index].phone ?? "",
                    style: TextStyle(color: Colors.deepPurple),
                    // textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton.icon(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    onPressed: () {
                      launch(
                          "tel://${hospitals[index].contactPersonNumber ?? "0"}");
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
                ],
              ),
            )
          ],
        ),
      ),
      itemCount: hospitals.length,
    );
  }
}
