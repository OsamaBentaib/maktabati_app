import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/components/card_list.dart';
import 'package:maktabati/app/containers/components/header_title.dart';
import 'package:maktabati/app/containers/components/footer.dart';
import 'package:maktabati/app/containers/components/verification/verify_phone.dart';
import 'package:maktabati/app/containers/library/screens/library_dashboard/dashboard_screen.dart';
import 'package:maktabati/app/containers/parents/screens/parent_dashboard/dashboard_screen.dart';
import 'package:maktabati/app/containers/teachers/screens/dashboard/dashboard_screen.dart';
import 'package:maktabati/app/helpers/localData.dart';

import 'package:maktabati/constants.dart';

TeacherDashboardLocalData localdata = TeacherDashboardLocalData();

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isTeacherLogedIn = false;
  bool isParentLogedIn = false;
  bool isLibraryLogedIn = false;
  bool isInVerify = false;
  bool notLoggedin = false;
  _checkIfLogedIn() async {
    if (await localdata.read("teacher-access") != null) {
      setState(() {
        isTeacherLogedIn = true;
      });
    } else if (await localdata.read("parents-access") != null) {
      setState(() {
        isParentLogedIn = true;
      });
    } else if (await localdata.read("library-access") != null) {
      setState(() {
        isLibraryLogedIn = true;
      });
    } else if (await localdata.read("in-phone-verify-data") != null) {
      setState(() {
        isInVerify = true;
      });
    } else if (await localdata.read("teacher-profile-complete") != null) {
    } else {
      setState(() {
        notLoggedin = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _checkIfLogedIn();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isTeacherLogedIn) {
      return DashboardScreen();
    } else if (isParentLogedIn) {
      return ParentsDashboardScreen();
    } else if (isLibraryLogedIn) {
      return LibraryDashboardScreen();
    } else if (isInVerify) {
      return VerifyPhone();
    } else {
      return Scaffold(
        backgroundColor: kBackroundColor,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                HeaderTitle(),
                CardLists(),
                Footer(),
              ],
            ),
          ),
        ),
      );
    }
  }
}
