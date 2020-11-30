import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maktabati/app/connections/API/api_connection.dart';
import 'package:maktabati/app/connections/models/cities.dart';
import 'package:maktabati/app/containers/components/city/components/items.dart';
import 'package:maktabati/app/containers/components/school/school_screen.dart';
import 'package:maktabati/app/helpers/localData.dart';
import 'package:maktabati/icons.dart';
import 'package:http/http.dart' as http;

class CityBody extends StatefulWidget {
  final String isFor;
  final data;
  CityBody({
    Key key,
    this.isFor,
    this.data,
  }) : super(key: key);

  @override
  _CityBodyState createState() => _CityBodyState(isFor, data);
}

class _CityBodyState extends State<CityBody> {
  final String isFor;
  final data;
  _CityBodyState(this.isFor, this.data);
  APIConnect apiConnect = APIConnect();
  // var snapshot = new List<Cities>();

  List snapshot;
  _save(city) async {
    print("city" + city);
    await LocalData().save("parent-city", city);
  }

  _getCitiesData() {
    apiConnect.getCitiesLists().then(
      (response) {
        if (response != null) {
          setState(() {
            snapshot = json.decode(response)['cities'];
          });
        }
      },
    ).catchError((onError) => {print(onError)});
    print(snapshot);
  }

  @override
  void initState() {
    super.initState();
    this._getCitiesData();
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
          name: snapshot[index - 1]['city'] == null
              ? ''
              : snapshot[index - 1]['city'],
          press: () {
            _save(snapshot[index - 1]['city']);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SchoolScreen(isFor: isFor);
                },
              ),
            );
          },
        );
      },
    );
  }
}
