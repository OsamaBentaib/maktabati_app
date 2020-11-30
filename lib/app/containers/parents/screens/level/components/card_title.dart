import 'package:flutter/material.dart';
import 'package:maktabati/constants.dart';

class CardTitle extends StatelessWidget {
  final String title;
  const CardTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 0,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey[200],
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: kTextColor,
          fontFamily: rBold,
          fontWeight: FontWeight.w600,
          fontSize: 19,
        ),
      ),
    );
  }
}
