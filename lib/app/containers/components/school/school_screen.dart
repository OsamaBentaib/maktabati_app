import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/components/school/components/body.dart';
import 'package:maktabati/constants.dart';

class SchoolScreen extends StatelessWidget {
  final String isFor;
  const SchoolScreen({
    Key key,
    this.isFor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackroundColor,
      appBar: AppBar(
        title: Text(
          tSelectSchool,
          style: TextStyle(
            color: Colors.black,
            fontFamily: rBold,
          ),
        ),
        elevation: 0,
        backgroundColor: kTextWhiteColor,
      ),
      body: SchoolBody(isFor: isFor),
    );
  }
}
