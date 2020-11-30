import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/teachers/screens/dashboard/components/body.dart';
import 'package:maktabati/constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardBody(),
    );
  }
}
