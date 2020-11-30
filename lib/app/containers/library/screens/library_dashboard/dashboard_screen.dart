import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/library/screens/library_dashboard/components/body.dart';

class LibraryDashboardScreen extends StatelessWidget {
  const LibraryDashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LibraryDashboardBody(),
    );
  }
}
