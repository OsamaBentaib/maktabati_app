import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maktabati/app/connections/API/api_connection.dart';
import 'package:maktabati/app/containers/components/school/components/items.dart';
import 'package:maktabati/app/containers/parents/screens/phone/phone_screen.dart';
import 'package:maktabati/app/containers/teachers/screens/check/check_screen.dart';
import 'package:maktabati/app/helpers/localData.dart';
import 'package:maktabati/constants.dart';
import 'package:maktabati/icons.dart';

class SchoolBody extends StatefulWidget {
  final String isFor;
  final data;
  SchoolBody({Key key, this.isFor, this.data}) : super(key: key);

  @override
  _SchoolBodyState createState() => _SchoolBodyState(isFor, data);
}

class _SchoolBodyState extends State<SchoolBody> {
  final String isFor;
  final data;
  APIConnect apiConnect = APIConnect();
  _SchoolBodyState(this.isFor, this.data);

  List snapshot;
  _save(school) async {
    print("school" + school);
    await LocalData().save("parent-school", school);
  }

  _getSchoolsData() {
    apiConnect.getSchoolsLists().then(
      (response) {
        if (response != null) {
          setState(() {
            snapshot = json.decode(response)['schools'];
          });
        }
      },
    ).catchError((onError) => {print(onError)});
    print(snapshot);
  }

  @override
  void initState() {
    super.initState();
    this._getSchoolsData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot == null ? 1 : snapshot.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey[200],
                ),
                top: BorderSide(
                  width: 1,
                  color: Colors.grey[200],
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 40,
                  child: BsGeoAlt(
                    color: Colors.black,
                    size: 17,
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
          );
        }
        return Items(
          data: {
            "name": snapshot[index - 1]['name'] == null
                ? ''
                : snapshot[index - 1]['name'],
          },
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  if (isFor == iSFORPARENTS) {
                    _save(snapshot[index - 1]['_id']);
                    return ParentPhoneScreen();
                  } else {
                    return CheckForTeacher(
                      data: {
                        "city": snapshot[index - 1]['city'] == null
                            ? ''
                            : snapshot[index - 1]['city'],
                        "school": snapshot[index - 1]['_id'] == null
                            ? ''
                            : snapshot[index - 1]['_id']
                      },
                    );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
