import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maktabati/app/connections/API/api_connection.dart';
import 'package:maktabati/app/containers/main-screen.dart';
import 'package:maktabati/app/helpers/localData.dart';
import 'package:maktabati/constants.dart';
import 'package:maktabati/icons.dart';

class LibraryDashboardBody extends StatefulWidget {
  const LibraryDashboardBody({Key key}) : super(key: key);

  @override
  _LibraryDashboardBodyState createState() => _LibraryDashboardBodyState();
}

class _LibraryDashboardBodyState extends State<LibraryDashboardBody> {
  APIConnect apiConnect = APIConnect();
  TeacherDashboardLocalData localdata = TeacherDashboardLocalData();
  List snapshot;
  bool logoutModal = false;
  _onlogout() async {
    await localdata.remove("library-access");
    Route route = MaterialPageRoute(builder: (context) => MainScreen());
    Navigator.pushReplacement(context, route);
  }

  @override
  void initState() {
    super.initState();
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
            padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "Thanks For registring",
                    style: TextStyle(
                      fontFamily: rBlack,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    "Check your whatsapp inbox",
                    style: TextStyle(
                      fontFamily: rBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 6,
                  ),
                  child: Text(
                    "we sent the school supplies for you",
                    style: TextStyle(
                      fontFamily: rBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Messages-brox-send.svg",
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
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
                              onTap: () {},
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
                                      "Contact us",
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
