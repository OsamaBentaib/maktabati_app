import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maktabati/app/connections/API/api_connection.dart';
import 'package:maktabati/app/containers/components/verification/verify_phone.dart';
import 'package:maktabati/app/helpers/localData.dart';
import 'package:maktabati/constants.dart';

class ParentPhoneScreen extends StatefulWidget {
  ParentPhoneScreen({Key key}) : super(key: key);

  @override
  _ParentPhoneScreenState createState() => _ParentPhoneScreenState();
}

class _ParentPhoneScreenState extends State<ParentPhoneScreen> {
  APIConnect apiConnect = APIConnect();
  TeacherDashboardLocalData localdata = TeacherDashboardLocalData();
  bool loading = false, valid = false;
  String err = "";
  TextEditingController _controllerPhone = TextEditingController();
  _intData() async {
    final level = await LocalData().read("parent-level");
    final school = await LocalData().read("parent-school");
    final city = await LocalData().read("parent-city");
    final data = {
      "level": level,
      "school": school,
      "city": city,
    };
    print(data);
    return data;
  }

  @override
  void initState() {
    super.initState();
    _intData();
  }

  _onhandelSubmit() {
    if (_controllerPhone.text.length != 9) {
      setState(() {
        err = "Please enter a valid number";
      });
    } else {
      _onTryToAccess();
    }
  }

  _onhandelChange() {
    if (_controllerPhone.text.length != 0) {
      setState(() {
        valid = true;
      });
    } else {
      setState(() {
        valid = false;
      });
    }
  }

  _onTryToAccess() async {
    final level = await LocalData().read("parent-level");
    final school = await LocalData().read("parent-school");
    final city = await LocalData().read("parent-city");
    final data = {
      "level": level,
      "school": school,
      "city": city,
    };
    await LocalData().save("in-phone-verify-data", data);
    await localdata.save("redirect", iSFORPARENTS);
    Route route = MaterialPageRoute(
      builder: (context) => VerifyPhone(),
    );
    Navigator.pushReplacement(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 70, 20, 50),
                      child: Text(
                        "Add Phone",
                        style: TextStyle(
                          fontFamily: rBold,
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                              "assets/icons/Mobile-bro.svg",
                              height: 200,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              "Please use your whatsapp number for addition contact",
                              style: TextStyle(
                                fontFamily: rLight,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: kTextColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 1,
                                        color: Colors.grey[200],
                                      ),
                                      left: BorderSide(
                                        width: 1,
                                        color: Colors.grey[200],
                                      ),
                                      right: BorderSide(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "+212",
                                        style: TextStyle(
                                          fontFamily: rMedium,
                                          fontSize: 16,
                                          color: kTextColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Container(
                                    child: TextField(
                                      onChanged: (value) => _onhandelChange(),
                                      controller: _controllerPhone,
                                      // autofocus: true,
                                      enableInteractiveSelection: false,
                                      focusNode: FocusNode(),
                                      keyboardType: TextInputType.phone,
                                      style: TextStyle(
                                        fontFamily: rMedium,
                                        fontSize: 16,
                                        color: kTextColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        border: InputBorder.none,
                                        hintText: "6 000-000-000",
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
                              ],
                            ),
                          ),
                          err != ""
                              ? Container(
                                  padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                                  child: Text(
                                    err,
                                    style: TextStyle(
                                      fontFamily: rLight,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              : Container(),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              "* After Submit you will recive a message in your whatsapp account for verification ",
                              style: TextStyle(
                                fontFamily: rLight,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: kTextColor,
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
                                    loading ? "Please wait.." : "Submit",
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
