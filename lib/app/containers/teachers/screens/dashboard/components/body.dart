import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:maktabati/app/connections/API/api_connection.dart';
import 'package:maktabati/app/containers/main-screen.dart';
import 'package:maktabati/app/containers/teachers/screens/addNew/addNew_screen.dart';
import 'package:maktabati/app/containers/teachers/screens/dashboard/components/added_item.dart';
import 'package:maktabati/app/helpers/localData.dart';
import 'package:maktabati/constants.dart';
import 'package:maktabati/icons.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({Key key}) : super(key: key);

  @override
  _DashboardBodyState createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  APIConnect apiConnect = APIConnect();
  TeacherDashboardLocalData localdata = TeacherDashboardLocalData();

  List snapshot;
  bool logoutModal = false;
  _onlogout() async {
    await localdata.remove("teacher-access");
    Route route = MaterialPageRoute(builder: (context) => MainScreen());
    Navigator.pushReplacement(context, route);
  }

  _getDashboardData() {
    apiConnect.getTeacherDashboard().then(
      (response) {
        print(response.body);
        print(response.statusCode);
        if (response.statusCode == 200) {
          setState(() {
            snapshot = json.decode(response.body);
          });
        }
      },
    ).catchError((onError) => {print(onError)});
  }

  @override
  void initState() {
    super.initState();
    this._getDashboardData();
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
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return AddedItem();
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
                              color: Colors.red[200],
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  logoutModal = true;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
                                child: BsBoxArrowLeft(
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          width: MediaQuery.of(context).size.width - 100,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(6)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return AddNewScreen();
                                  }),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    BsPlus(
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "New",
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
          ),
          Positioned.fill(
            bottom: MediaQuery.of(context).size.height - 90,
            left: 0,
            right: 0,
            top: 0,
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
                    padding: EdgeInsets.fromLTRB(30, 26, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Dashboard",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: rBold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          logoutModal
              ? Positioned.fill(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height - 240,
                  child: Container(
                    width: double.infinity,
                    height: 240,
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
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 50, 10, 70),
                                child: Text(
                                  "Are you sure you want to logout?",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: rBold,
                                  ),
                                ),
                              ),
                              Container(
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                logoutModal = false;
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 15, 5, 15),
                                              child: Icon(
                                                Icons.arrow_back,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.red[200],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              this._onlogout();
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  BsBoxArrowLeft(
                                                    size: 25,
                                                    color: Colors.red,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "Logout",
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontFamily: rBold,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
