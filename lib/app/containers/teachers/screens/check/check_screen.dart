import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/teachers/screens/dashboard/dashboard_screen.dart';
import 'package:maktabati/app/connections/API/api_connection.dart';
import 'package:maktabati/constants.dart';
import 'package:maktabati/icons.dart';

class CheckForTeacher extends StatefulWidget {
  final data;
  CheckForTeacher({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  _CheckForTeacherState createState() => _CheckForTeacherState(data);
}

class _CheckForTeacherState extends State<CheckForTeacher> {
  APIConnect apiConnect = APIConnect();
  final data;
  bool loading = true;
  _CheckForTeacherState(this.data);
  _createTeacherProfile(request) {
    print(request);
    print("start");
    apiConnect
        .createTeacherProfile(request)
        .then((response) => {
              if (response.statusCode == 201)
                {
                  setState(() {
                    loading = false;
                  })
                }
            })
        .catchError((err) => print(err));
  }

  void initState() {
    super.initState();
    final request = <String, String>{
      "city": data["city"],
      "school": data["school"],
      "teacher": data['teacher']
    };
    _createTeacherProfile(request);
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
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(70),
                    child: !loading
                        ? BsCheckCircle(
                            size: 90,
                            color: Colors.green[400],
                          )
                        : Container(
                            height: 90,
                            width: 90,
                          ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      loading ? "Almost done..." : "All done",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: rBold,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
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
                      child: Container(
                        decoration: BoxDecoration(
                            color: loading
                                ? kPrimaryColor.withOpacity(0.5)
                                : kPrimaryColor,
                            borderRadius: BorderRadius.circular(6)),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return DashboardScreen();
                                }),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: 10),
                                  Text(
                                    loading ? "Please Wait.." : "Finish",
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
