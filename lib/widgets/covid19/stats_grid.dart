import 'package:flutter/material.dart';
import 'package:trackcorona/viewmodels/corona/corona_view_model.dart';

class StatsGrid extends StatefulWidget {
  // final CoronaViewModel corona;
  final String countryName;
  final List<CoronaViewModel> coronaList;

  StatsGrid({this.coronaList, this.countryName});

  @override
  _StatsGridState createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {
  List<CoronaViewModel> coronaListViewModel;
  int index;
  @override
  void initState() {
    super.initState();
    coronaListViewModel = this.widget.coronaList;
  }

  @override
  Widget build(BuildContext context) {
    // coronaListViewModel = this
    //     .coronaList
    //     .where((coronaData) => coronaData.contains( countryName))
    //     .map((coronaData) => Text(coronaData)).toList();
    // coronaList.forEach((e) {
    //   if (e == "Nepal") print("HELLO" + e.toString());
    // });
    coronaListViewModel.asMap().forEach((i, value) {
      // print(
      //     'index=$i, value=${coronaListViewModel[i].countryName}, death=${coronaListViewModel[i].criticalCases}');
      if (coronaListViewModel[i].countryName == this.widget.countryName)
        setState(() {
          index = i;
          return;
        });
    });
    // for (var i = 0; i < coronaListViewModel.length; i++)
    //   print('index=$i, value=${coronaListViewModel[i].countryName}');

    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard(
                    'Total Cases',
                    // coronaListViewModel.toString(),
                    // this.corona.totalCases.toString(),
                    //  coronaList.where((w) => w=="Nepal")
                    // coronaList.where((w) => w == "Nepal").join(" "),
                    //  " coronaList.where((item) => item.contains("Nepal")).toString()",
                    this.widget.coronaList[index].totalCases.toString(),
                    Colors.orange),
                _buildStatCard(
                    'Total Deaths',
                    this.widget.coronaList[index].totalDeaths.toString(),
                    Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard(
                    'New Cases',
                    this.widget.coronaList[index].newCases.toString(),
                    Colors.orange),
                _buildStatCard(
                    'New Deaths',
                    this.widget.coronaList[index].newDeaths.toString(),
                    Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard(
                    'Recovered',
                    this.widget.coronaList[index].totalRecovered.toString(),
                    Colors.green),
                _buildStatCard(
                    'Active',
                    this.widget.coronaList[index].activeCases.toString(),
                    Colors.lightBlue),
                _buildStatCard(
                    'Critical',
                    this.widget.coronaList[index].criticalCases.toString(),
                    Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    // return Expanded(
    //   child: Container(
    //     margin: const EdgeInsets.all(8.0),
    //     padding: const EdgeInsets.all(10.0),
    //     decoration: BoxDecoration(
    //       color: color,
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Text(
    //         title,
    //         style: const TextStyle(
    //           color: Colors.white,
    //           fontSize: 15.0,
    //           fontWeight: FontWeight.w600,
    //         ),
    //       ),
    //       Text(
    //         count,
    //         style: const TextStyle(
    //           color: Colors.white,
    //           fontSize: 20.0,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
    // );
    return Expanded(
      child: Card(
        // margin: const EdgeInsets.all(8.0),

        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // padding: const EdgeInsets.all(10.0),
        ),
        // elevation: 10,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                count,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
