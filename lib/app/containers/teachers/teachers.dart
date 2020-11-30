import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/landing/Landing.dart';
import 'package:maktabati/app/containers/teachers/screens/access/accsess_screen.dart';
import 'package:maktabati/constants.dart';

class TeachersScreen extends StatelessWidget {
  const TeachersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackroundColor,
      body: Landing(
        title: tParentsWelcom,
        description: tParentsDescribe,
        isFor: iSFORTEACHER,
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return AccessSecreen();
            }),
          );
        },
      ),
    );
  }
}
