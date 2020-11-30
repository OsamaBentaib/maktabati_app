import 'package:flutter/material.dart';
import 'package:maktabati/constants.dart';
import 'package:maktabati/icons.dart';

class SuccessScreen extends StatelessWidget {
  final String bgText, smText;
  const SuccessScreen({Key key, this.bgText, this.smText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackroundColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: BsCheckCircle(
                size: 70,
                color: Colors.green[400],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                bgText,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: rBold,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                smText,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: rBold,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
