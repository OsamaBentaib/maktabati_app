import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/parents/screens/parent_dashboard/components/body.dart';

class ParentsDashboardScreen extends StatelessWidget {
  const ParentsDashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ParentsDashboardBody(),
    );
  }
}
