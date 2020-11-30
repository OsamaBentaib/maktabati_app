import 'package:flutter/material.dart';
import 'package:maktabati/constants.dart';
import 'package:maktabati/icons.dart';

class LandingCardButton extends StatelessWidget {
  final Function press;
  const LandingCardButton({Key key, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // padding: EdgeInsets.all(20),
      width: size.width * 0.8,
      // it will cover 80% of total width
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BsArrowRight(),
                SizedBox(width: 10),
                Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: rBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
