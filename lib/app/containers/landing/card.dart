import 'package:flutter/material.dart';
import 'package:maktabati/constants.dart';

class LandingCard extends StatelessWidget {
  final Size size;
  final Function press;
  const LandingCard({Key key, this.size, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: 0,
      left: 0,
      right: 0,
      top: MediaQuery.of(context).size.height - 90,
      child: Container(
        width: double.infinity,
        height: 90,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 20,
                color: Color(0xFFB0CCE1).withOpacity(0.32),
              ),
            ],
          ),
          child: Container(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: press,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 10),
                          Text(
                            "Get started",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: rBold,
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
