import 'package:flutter/material.dart';
// import 'package:trackcorona/models/country.dart';
import 'package:trackcorona/screens/country_detail_screen.dart';
import 'package:trackcorona/viewmodels/country_view_model.dart';
import 'package:trackcorona/widgets/circular_image.dart';

class CountryGrid extends StatelessWidget {
  final List<CountryViewModel> countries;
  CountryGrid({this.countries});
  void _showCountryDetails(BuildContext context, CountryViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return CountryDetailScreen(
        country: vm,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: this.countries.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? 2
                  : 3),
      itemBuilder: (BuildContext _, int index) {
        final country = this.countries[index];

        return GestureDetector(
          onTap: () {
            _showCountryDetails(context, country);
          },
          child: Card(
            color: Colors.white10.withOpacity(0.5),
            child: GridTile(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: CircularImage(
                  imageUrl: country.countryflag,
                ),
              ),
              footer: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                child: Text(
                  country.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purpleAccent,
                  ),
                  maxLines: 1,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
