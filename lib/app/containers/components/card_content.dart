import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/components/card_button.dart';
import 'package:maktabati/app/containers/library/library.dart';
import 'package:maktabati/app/containers/parents/parents.dart';
import 'package:maktabati/app/containers/teachers/teachers.dart';
import 'package:maktabati/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardContent extends StatelessWidget {
  final String textTitle, svgSrc;
  const CardContent({Key key, this.textTitle, this.svgSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 160,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      color: Color(0xFFB0CCE1).withOpacity(0.32),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: tFor + "\n",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: rMedium,
                                      ),
                                    ),
                                    TextSpan(
                                      text: textTitle,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 15,
                                ),
                                decoration: BoxDecoration(),
                                child: CardButton(
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          if (textTitle == tForParents) {
                                            return ParentsScreen();
                                          } else if (textTitle == tForLibrary) {
                                            return LibraryScreen();
                                          } else {
                                            return TeachersScreen();
                                          }
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 120,
                          height: 120,
                          child: SvgPicture.asset(
                            textTitle == tForParents
                                ? "assets/icons/Back-to-school-bro.svg"
                                : textTitle == tForLibrary
                                    ? "assets/icons/Bookshop-bro.svg"
                                    : "assets/icons/Teacher-bro.svg",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
