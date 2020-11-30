import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/landing/card.dart';
import 'package:maktabati/app/containers/landing/image.dart';

class Landing extends StatelessWidget {
  final String title, description, isFor;
  final Function press;
  const Landing({
    Key key,
    this.description,
    this.press,
    this.title,
    this.isFor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          LandingImage(
            size: size,
            title: title,
            description: description,
            isFor: isFor,
          ),
          LandingCard(size: size, press: press)
        ],
      ),
    );
  }
}
