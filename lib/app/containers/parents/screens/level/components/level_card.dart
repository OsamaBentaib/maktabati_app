import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/components/city/city_screen.dart';
import 'package:maktabati/app/containers/parents/screens/level/components/card_item.dart';
import 'package:maktabati/app/containers/parents/screens/level/components/card_title.dart';
import 'package:maktabati/app/helpers/localData.dart';
import 'package:maktabati/constants.dart';

class LevelCard extends StatelessWidget {
  final snapshot;
  const LevelCard({
    Key key,
    this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _save(_id) async {
      await LocalData().save("parent-level", _id);
    }

    // press(_id) {
    //   _save(_id);
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) {
    //       return CityScreen(isFor: iSFORPARENTS);
    //     }),
    //   );
    // }

    List levels = snapshot['levels'];
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CardTitle(
                title: snapshot['type'],
              ),
              // CardItem(press: press("_id")),
            ],
          ),
        ),
      ),
    );
  }
}
