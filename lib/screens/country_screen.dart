import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trackcorona/utils/palette.dart';
// import 'package:trackcorona/viewmodels/country_view_model.dart';
import 'package:trackcorona/viewmodels/country_list_view_model.dart';
import 'package:trackcorona/widgets/country_grid.dart';
import 'package:trackcorona/widgets/covid19/custom_appbar.dart';
// import 'package:websafe_svg/websafe_svg.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class CountryScreen extends StatefulWidget {
  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CountryListViewModel>(context, listen: false).allCountries();
  }

  Widget _buildList(CountryListViewModel clvm) {
    switch (clvm.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CountryGrid(countries: clvm.countries),
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

  // void _selectCountry(CountryListViewModel vs, String country) {
  //   vs.selectedDetailOfCountry(country);
  // }

  @override
  Widget build(BuildContext context) {
    var listViewModel =
        Provider.of<CountryListViewModel>(context, listen: true);
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(
        titleName: "Country List",
      ),
      body: _buildList(listViewModel),
    );
  }
}

// GridView.builder(
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (context, index) {
//           print(
//               "List of ${listViewModel.countries[index].name} and ${listViewModel.countries.length}");
//           return GridTile(
//               child: Container(
//                   child: CachedNetworkImage(
//             imageUrl: listViewModel.countries[index].countryflag,
//           )));
//         },
//         itemCount: listViewModel.countries.length ?? 0,
//       ),
