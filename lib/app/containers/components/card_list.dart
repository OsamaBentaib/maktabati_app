import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/components/card_content.dart';
import 'package:maktabati/constants.dart';

class CardLists extends StatelessWidget {
  const CardLists({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            CardContent(textTitle: tForParents,),
            CardContent(textTitle: tForTeachers,),
            CardContent(textTitle: tForLibrary,),
          ],
        ),
      ),
    );
  }
}
