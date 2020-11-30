import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/main-screen.dart';
import 'package:maktabati/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
/*
 * ===================
 *   ROOT WIDGET
 * ===================
 */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
      * ===================
      *   SET DEBUGE CHECK AS FALSE
      * ===================
      */
      debugShowCheckedModeBanner: false,
      /*
      * ===================
      *  THE MAIN TITLE OF THE APP
      * ===================
      */
      title: 'Maktabati',
      theme: ThemeData(
        /*
        * ===============================
        *   THE PRIMARY COLOR FOR THE THEM
        * ================================
        */
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackroundColor,
        textTheme: TextTheme(
          body1: TextStyle(color: ksecondaryColor),
          body2: TextStyle(color: ksecondaryColor),
        ),
      ),
      home: MainScreen(),
    );
  }
}
