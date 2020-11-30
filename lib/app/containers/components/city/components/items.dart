import 'package:flutter/material.dart';
import 'package:maktabati/constants.dart';
import 'package:maktabati/icons.dart';

class Items extends StatelessWidget {
  final Function press;
  final String name;
  const Items({Key key, this.press, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: InkWell(
        onTap: press,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.grey[200],
              ),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    name,
                    style: TextStyle(
                      color: kTextColor,
                      fontFamily: rMedium,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  child: BsArrowRight(
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
