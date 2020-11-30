import 'package:flutter/material.dart';
import 'package:maktabati/constants.dart';

class LandingImage extends StatelessWidget {
  final Size size;
  final String title, description, isFor;
  const LandingImage({
    Key key,
    this.size,
    this.description,
    this.title,
    this.isFor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage(
                isFor == iSFORPARENTS
                    ? "assets/images/Back-to-school-bro.png"
                    : isFor == iSFORTEACHER
                        ? "assets/images/Teacher-bro.png"
                        : "assets/images/Bookshop-bro.png",
              ),
            ),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontFamily: rBold,
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          description,
                          style: TextStyle(
                            fontFamily: rRegular,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
