import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:maktabati/constants.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 40),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              headerTitleBig,
              style: TextStyle(
                fontFamily: rBold,
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              headerTitleSmall,
              style: TextStyle(
                fontFamily: rMedium,
                fontSize: 17,
                color: kTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
