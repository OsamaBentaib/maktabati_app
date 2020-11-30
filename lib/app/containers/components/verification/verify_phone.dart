import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maktabati/app/connections/API/api_connection.dart';
import 'package:maktabati/app/containers/components/city/city_screen.dart';
import 'package:maktabati/app/containers/library/screens/library_dashboard/dashboard_screen.dart';
import 'package:maktabati/app/containers/parents/screens/parent_dashboard/dashboard_screen.dart';
import 'package:maktabati/app/helpers/localData.dart';
import 'package:maktabati/constants.dart';

class VerifyPhone extends StatefulWidget {
  VerifyPhone({
    Key key,
  }) : super(key: key);

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  dynamic redirect;
  APIConnect apiConnect = APIConnect();
  TeacherDashboardLocalData localdata = TeacherDashboardLocalData();
  bool loading = false, valid = false;
  String err = "";
  TextEditingController _controlleCode = TextEditingController();
  _onRemoveData() async {
    await localdata.remove("in-phone-verify-data");
  }

  _onGetRedirect() async {
    final data = await localdata.read("redirect");
    print("we will redirect to => " + data);
    if (data != null) {
      setState(() {
        redirect = jsonDecode(data);
      });
    }
    print("redirect => " + redirect);
  }

  @override
  void initState() {
    super.initState();
    _onGetRedirect();
  }

  _onhandelSubmit() {
    if (_controlleCode.text.length == 6) {
      final code = _controlleCode.text;
      _onTryToVerify(code);
    }
  }

  _onhandelChange() {
    if (_controlleCode.text.length == 6) {
      setState(() {
        valid = true;
      });
    } else {
      setState(() {
        valid = false;
        err = "Please enter valid 6 digits";
      });
    }
  }

  _onSave(key) async {
    await localdata.save(key, {"isAuth": true});
  }

  _onTryToVerify(data) {
    apiConnect.onTryToVerify(data).then((response) {
      print(response);
      if (response == 200) {
        _onRemoveData();
        print(iSFORTEACHER.toString() + " ======= " + redirect);
        print(iSFORLIBRARY.toString() + " ======= " + redirect);
        print(iSFORPARENTS.toString() + " ======= " + redirect);
        if (redirect == iSFORTEACHER) {
          _onSave("teacher-profile-complete");
          Route route = MaterialPageRoute(
            builder: (context) => CityScreen(isFor: iSFORTEACHER),
          );
          Navigator.pushReplacement(context, route);
        } else if (redirect == iSFORPARENTS) {
          _onSave("parents-access");
          Route route = MaterialPageRoute(
            builder: (context) => ParentsDashboardScreen(),
          );
          Navigator.pushReplacement(context, route);
        } else if (redirect == iSFORLIBRARY) {
          _onSave("library-access");
          Route route = MaterialPageRoute(
            builder: (context) => LibraryDashboardScreen(),
          );
          Navigator.pushReplacement(context, route);
        }
      } else {
        setState(() {
          err = "Sorry the code is incorrect!";
        });
      }
    }).catchError((onError) => {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 70, 20, 50),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: SvgPicture.asset(
                              "assets/icons/New-message-bro.svg",
                              height: 200,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Text(
                              "Verify your phone number",
                              style: TextStyle(
                                fontFamily: rMedium,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: kTextColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              "Enter the 6 digits code that you will recive in your whatsapp!",
                              style: TextStyle(
                                fontFamily: rLight,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: kTextColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 40),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 30,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                child: TextField(
                                  onChanged: (value) => _onhandelChange(),
                                  controller: _controlleCode,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    fontFamily: rMedium,
                                    fontSize: 16,
                                    color: kTextColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    border: InputBorder.none,
                                    hintText: "Enter code",
                                    hintStyle: TextStyle(
                                      fontFamily: rMedium,
                                      fontSize: 16,
                                      color: kTextColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                      child: Container(
                        decoration: BoxDecoration(
                            color: !valid || loading
                                ? kPrimaryColor.withOpacity(0.5)
                                : kPrimaryColor,
                            borderRadius: BorderRadius.circular(6)),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              if (valid) {
                                this._onhandelSubmit();
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: 10),
                                  Text(
                                    loading ? "Please wait.." : "Verify",
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
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
