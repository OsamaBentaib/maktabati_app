import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maktabati/app/containers/library/screens/phone/library_phone.dart';
import 'package:maktabati/app/helpers/localData.dart';
import 'package:maktabati/constants.dart';

class LocationBody extends StatefulWidget {
  LocationBody({Key key}) : super(key: key);

  @override
  _LocationBodyState createState() => _LocationBodyState();
}

class _LocationBodyState extends State<LocationBody> {
  _onhandelSubmit() async {
    final location = {
      "lng": "0.00000",
      "lat": "-0.00000",
      'city': "Chefchaouen"
    };
    await LocalData().save("library-location", location);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LibraryPhone();
        },
      ),
    );
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "Turn on the location",
                    style: TextStyle(
                      fontFamily: rBold,
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
                    "We need to know the shop location",
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
                    "assets/icons/Directions-bro.svg",
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            right: 10,
            bottom: 100,
            left: MediaQuery.of(context).size.width - 70,
            top: MediaQuery.of(context).size.height - 160,
            child: GestureDetector(
              onTap: () {
                _onhandelSubmit();
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      color: Color(0xFFB0CCE1).withOpacity(0.32),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.gps_fixed,
                      size: 20,
                      color: Colors.black,
                    ),
                  ],
                ),
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
                          color: kPrimaryColor.withOpacity(0.5),
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
                                SizedBox(width: 10),
                                Text(
                                  "Next",
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
    );
  }
}
