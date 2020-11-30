import 'package:flutter/material.dart';
import 'package:maktabati/constants.dart';

class CardItem extends StatelessWidget {
  final Function press;
  final String title;
  const CardItem({Key key, this.press, this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: press,
        child: Container(
          padding: EdgeInsets.all(20),
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
                fontFamily: rLight,
                fontSize: 17,
                fontWeight: FontWeight.w900,
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}
