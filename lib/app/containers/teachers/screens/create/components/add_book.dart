import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maktabati/app/connections/API/api_connection.dart';
import 'package:maktabati/app/containers/parents/screens/level/components/card_title.dart';
import 'package:maktabati/app/containers/teachers/screens/dashboard/dashboard_screen.dart';
import 'package:maktabati/constants.dart';
import 'package:maktabati/icons.dart';

class AddBook extends StatefulWidget {
  AddBook({Key key}) : super(key: key);

  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  String selectedLevel = "";
  TextEditingController _controllerName = TextEditingController();
  bool valid = false, loading = false;
  String title;
  List levels;

  _onhandelSubmit() async {
    final read = await localdata.read("teacher-access");
    Map<String, dynamic> token = jsonDecode(jsonDecode(read));
    final String id = token['_id'];
    if (selectedLevel != "" && _controllerName.text.toString() != "") {
      setState(() {
        loading = true;
      });
      final data = <String, dynamic>{
        "type": "Book",
        "level": selectedLevel,
        "teacher": id,
        "book": {"name": _controllerName.text.toString()},
      };
      Route route = MaterialPageRoute(builder: (context) => DashboardScreen());
      print(jsonEncode(data));
      APIConnect()
          .createNewSchoolSupplies(data)
          .then(
            (value) => {
              if (value.statusCode == 201)
                {Navigator.pushReplacement(context, route)}
            },
          )
          .catchError((onError) => {print(onError)});
    }
  }

  _onFetchLevels() async {
    APIConnect().getTeacherLevel().then((value) {
      final data = jsonDecode(value.body);
      setState(() {
        title = data['schoolTypes']['type'];
        levels = data['schoolTypes']['levels'];
      });
    }).catchError((onError) => print(onError));
  }

  _onhandelSetLevel(_id) {
    setState(() {
      selectedLevel = _id;
    });
    _setValid();
  }

  _onhandelChange() {
    _setValid();
  }

  _setValid() {
    if (selectedLevel != "" && _controllerName.text.toString() != "") {
      setState(() {
        valid = true;
      });
    } else {
      setState(() {
        valid = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _onFetchLevels();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.fromLTRB(0, 60, 0, 90),
            color: Colors.white,
            child: ListView.builder(
              itemCount: levels != null ? levels.length + 3 : 3,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Add Book",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: rBold,
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                          ),
                        ),
                      )
                    ],
                  );
                }
                if (index == 1) {
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                  bottom: 10,
                                ),
                                child: Text(
                                  "Book name",
                                  style: TextStyle(
                                    fontFamily: rBlack,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                padding: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Container(
                                  child: TextField(
                                    onChanged: (value) => _onhandelChange(),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
                                      border: InputBorder.none,
                                      hintText: "",
                                      hintStyle: TextStyle(
                                        fontFamily: rBlack,
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    controller: _controllerName,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }
                if (index == 2) {
                  return CardTitle(
                    title: title == null ? "" : title,
                  );
                }
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: selectedLevel == levels[index - 3]["_id"]
                        ? kBackroundColor
                        : null,
                  ),
                  child: InkWell(
                    onTap: () {
                      _onhandelSetLevel(levels[index - 3]["_id"]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                      child: Text(
                        levels[index - 3]["name"],
                        style: TextStyle(
                            fontFamily: rLight,
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned.fill(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey[200],
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
                                child: Icon(
                                  Icons.arrow_back,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          width: MediaQuery.of(context).size.width - 100,
                          decoration: BoxDecoration(
                              color: valid && !loading
                                  ? kPrimaryColor
                                  : kPrimaryColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(6)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _onhandelSubmit();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    BsNotBook(
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      loading ? "Creating..." : "Create",
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
