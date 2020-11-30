import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/landing/Landing.dart';
import 'package:maktabati/app/containers/library/screens/location/location.dart';
import 'package:maktabati/constants.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackroundColor,
      body: Landing(
        title: tLibraryWelcom,
        description: tParentsDescribe,
        isFor: iSFORLIBRARY,
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return LibraryLocation();
            }),
          );
        },
      ),
    );
  }
}
