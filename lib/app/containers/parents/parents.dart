import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/landing/Landing.dart';
import 'package:maktabati/app/containers/parents/screens/level/level_screen.dart';
import 'package:maktabati/constants.dart';

class ParentsScreen extends StatelessWidget {
  const ParentsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackroundColor,
      body: Landing(
        title: tParentsWelcom,
        description: tParentsDescribe,
        isFor: iSFORPARENTS,
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return LevelScreen();
            }),
          );
        },
      ),
    );
  }
}
