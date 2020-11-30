import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:maktabati/constants.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 30, 15, 10),
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey[200],
          ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.copyright,
                    color: Colors.grey,
                    size: 12,
                  ),
                ),
                Container(
                  child: Text(
                    " Copyright 2020-2021. Maktabati, All right reserved.",
                    style: TextStyle(
                      fontFamily: rLight,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: rLight,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: kTextColor,
                ),
                children: [
                  TextSpan(
                    text: "All thanks to ",
                  ),
                  TextSpan(
                    text: "Freepik.com ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "for those aweosome draws",
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.3,
                  color: Colors.grey[300],
                ),
                Container(
                  child: Text(
                    "About",
                    style: TextStyle(
                      fontFamily: rLight,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kTextColor,
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.3,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Developed & Designed by",
                  style: TextStyle(
                    fontFamily: rLight,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kTextColor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Osama Bentaib",
                  style: TextStyle(
                    fontFamily: rLight,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: kTextColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
