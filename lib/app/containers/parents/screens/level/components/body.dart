import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/components/city/city_screen.dart';
import 'package:maktabati/app/containers/parents/screens/level/components/card_item.dart';
import 'package:maktabati/app/containers/parents/screens/level/components/card_title.dart';
import 'package:maktabati/app/connections/API/api_connection.dart';
import 'package:maktabati/app/helpers/localData.dart';
import 'package:maktabati/constants.dart';

class LevelBody extends StatefulWidget {
  LevelBody({Key key}) : super(key: key);

  @override
  _LevelBodyState createState() => _LevelBodyState();
}

class _LevelBodyState extends State<LevelBody> {
  APIConnect apiConnect = APIConnect();
  List schoolTypes;
  _save(_id) async {
    print(_id);
    await LocalData().save("parent-level", _id);
  }

  _getSchoolTypes() {
    APIConnect().getSchoolTypes().then((response) {
      print(response.body);
      print(response.statusCode);
      setState(() {
        schoolTypes = json.decode(response.body)['schoolTypes'];
      });
    });
  }

  initState() {
    super.initState();
    _getSchoolTypes();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: schoolTypes == null ? 0 : schoolTypes.length,
          itemBuilder: (BuildContext context, int index) {
            List levels = schoolTypes[index]['levels'];
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
                        title: schoolTypes[index]['type'],
                      ),
                      for (var i = 0; i < levels.length; i++)
                        CardItem(
                          press: () {
                            this._save(levels[i]['_id']);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return CityScreen(isFor: iSFORPARENTS);
                              }),
                            );
                          },
                          title: levels[i]['name'],
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
