import 'dart:async';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackcorona/utils/palette.dart';
import 'package:trackcorona/utils/styles.dart';
import 'package:trackcorona/viewmodels/corona/corona_list_view_model.dart';
import 'package:trackcorona/viewmodels/corona/corona_view_model.dart';
import 'package:trackcorona/widgets/covid19/custom_appbar.dart';
import 'package:trackcorona/widgets/covid19/stats_grid.dart';

import 'package:smart_select/smart_select.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  String countryNameFor = 'Nepal';
  String value = 'Nepal';
  int countryIndex = 4;
  String showTable = "true";
  List<SmartSelectOption<String>> options = [
    // SmartSelectOption<String>(value: 'ion', title: 'Ionic'),
    // SmartSelectOption<String>(value: 'flu', title: 'Flutter'),
    // SmartSelectOption<String>(value: 'rea', title: 'React Native'),
  ];
  @override
  void initState() {
    super.initState();
    Provider.of<CoronaListViewModel>(context, listen: false).allCoronaDetails();
    countryNameFor = 'Nepal';
    showTable = "false";
  }

  Widget _buildScreen(CoronaListViewModel clvm) {
    switch (clvm.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: <Widget>[
              _buildHeader(),
              _buildRegionTabBar(clvm.coronaDetails),
              if (showTable == "false")
                _buildFlagWithInfo(clvm.coronaDetails),
              // _buildStatsTabBar(),
              if (showTable == "false")
                SliverPadding(
                  padding: const EdgeInsets.all(20.0),
                  // padding: cotruedgeInsets.symmetric(horizontal: 10.0),
                  sliver: SliverToBoxAdapter(
                    child: StatsGrid(
                        coronaList: clvm.coronaDetails,
                        countryName: countryNameFor),
                  ),
                ),
              // SliverPadding(
              //   padding: const EdgeInsets.only(top: 20.0),
              //   sliver: SliverToBoxAdapter(
              //     child: CovidBarChart(covidCases: covidUSADailyNewCases),
              //   ),
              // ),
              if (showTable == "false")
                _showInMap(clvm.coronaDetails),

              if (showTable == "true")
                _viewInTable(clvm.coronaDetails)
            ]);
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
    final listViewModel =
        Provider.of<CoronaListViewModel>(context, listen: true);
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(
        titleName: "Corona Stats",
      ),
      body: _buildScreen(listViewModel),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  int getCountryIndex(String countryName, List<CoronaViewModel> corona) {
    corona.asMap().forEach((i, value) {
      // print(
      //     'index=$i, value=${coronaListViewModel[i].countryName}, death=${coronaListViewModel[i].criticalCases}');
      if (corona[i].countryName == countryName)
        setState(() {
          countryNameFor = countryName;
          countryIndex = i;
          return;
        });
    });
    return 3;
  }

  addCountryInList(List<CoronaViewModel> corona) {
    corona.asMap().forEach((i, value) {
      // print(
      //     'index=$i, value=${corona[i].countryName}, death=${corona[i].criticalCases}');
      // if (corona[i].countryName == this.widget.countryName)
      // setState(() {
      //   index = i;
      //   return;
      // });
      // setState(() {
      if (corona[i].countryName != "" || corona[i].countryName != "World")
        options.add(SmartSelectOption<String>(
            value: corona[i].countryName, title: corona[i].countryName));
      // );
      // return;
      // });
    });
  }

  SliverToBoxAdapter _buildRegionTabBar(List<CoronaViewModel> corona) {
    getCountryIndex(countryNameFor, corona);
    addCountryInList(corona);
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 3,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Text(
                'My Country',
                textAlign: TextAlign.center,
              ),
              Text(
                'Global',
                textAlign: TextAlign.center,
              ),
              Text(
                'View Table',
                textAlign: TextAlign.center,
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                setState(() {
                  countryNameFor = 'Nepal';
                  showTable = "false";
                  getCountryIndex(countryNameFor, corona);
                });
              }
              if (index == 1) {
                setState(() {
                  showTable = "false";
                });
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return SmartSelect<String>.single(
                      title: 'Select Country',
                      // value: value,

                      value: countryNameFor,
                      options: options,
                      modalType: SmartSelectModalType.fullPage,
                      onChange: (val) =>
                          setState(() => getCountryIndex(val, corona)),
                      choiceType: SmartSelectChoiceType.chips,
                      selected: true,
                      leading: Image.network(
                        // "https://disease.sh/assets/img/flags/us.png",
                        corona[countryIndex].countryInfo.values.toList()[5],
                        width: 20,
                        height: 20,
                        // fit: BoxFit.cover,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                );
              }
              if (index == 2) {
                setState(() {
                  showTable = "true";
                });
              }
            },
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildFlagWithInfo(List<CoronaViewModel> corona) {
    return SliverToBoxAdapter(
      child: Card(
        color: Colors.white10.withOpacity(0.2),
        child: Container(
          width: 200,
          height: 200,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              // corona[countryIndex].countryName != "Nepal"
              //     ?
              Image.network(
                corona[countryIndex].countryInfo.values.toList()[5],
                width: 350,
                height: 250,
                // fit: BoxFit.cover,
                fit: BoxFit.contain,
              ),
              // : Image.network(
              //     "https://disease.sh/assets/img/flags/np.png",
              //     width: 350,
              //     height: 250,
              //     // fit: BoxFit.cover,
              //     fit: BoxFit.contain,
              //   ),
              Container(
                color: Colors.purpleAccent.withOpacity(0.4),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(corona[countryIndex].countryName,
                        style: TextStyle(fontSize: 28, color: Colors.white)),
                    Text(corona[countryIndex].continent,
                        style: TextStyle(fontSize: 22, color: Colors.white)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStatsTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: <Widget>[
              Text('Total'),
              Text('Today'),
              Text('Yesterday'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  SliverPadding _showInMap(List<CoronaViewModel> corona) {
    Completer<GoogleMapController> _controller = Completer();
    return SliverPadding(
      padding: EdgeInsets.all(10.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              // target: LatLng(28, 84),
              target: LatLng(
                  // corona[countryIndex].countryInfo.values.toList()[3],
                  // corona[countryIndex].countryInfo.values.toList()[4],
                  double.tryParse(corona[countryIndex]
                      .countryInfo
                      .values
                      .toList()[3]
                      .toString()),
                  double.tryParse(corona[countryIndex]
                      .countryInfo
                      .values
                      .toList()[4]
                      .toString())),

              zoom: 6,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ),
    );
  }

  SliverPadding _viewInTable(List<CoronaViewModel> coronalist) {
    return SliverPadding(
      padding: const EdgeInsets.all(10.0),
      sliver: SliverToBoxAdapter(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'country',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Total Cases',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'New Cases',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: List.generate(
            coronalist.length,
            (index) => DataRow(
              cells: <DataCell>[
                DataCell(Text(coronalist[index].countryName)),
                DataCell(Text(coronalist[index].totalCases.toString())),
                DataCell(Text(coronalist[index].newCases.toString())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
