import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/components/city/components/body.dart';
import 'package:maktabati/constants.dart';

class CityScreen extends StatelessWidget {
  final String isFor;
  const CityScreen({
    Key key,
    this.isFor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackroundColor,
      appBar: AppBar(
        title: Text(
          tSelectCity,
          style: TextStyle(
            color: Colors.black,
            fontFamily: rBold,
          ),
        ),
        elevation: 0,
        backgroundColor: kTextWhiteColor,
      ),
      body: CityBody(isFor: isFor),
    );
  }
}
