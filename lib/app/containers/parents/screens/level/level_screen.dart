import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/parents/screens/level/components/body.dart';
import 'package:maktabati/constants.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackroundColor,
      appBar: AppBar(
        title: Text(
          tSelectLevel,
          style: TextStyle(
            color: kTextColor,
          ),
        ),
        elevation: 0,
        backgroundColor: kTextWhiteColor,
      ),
      body: LevelBody(),
    );
  }
}
