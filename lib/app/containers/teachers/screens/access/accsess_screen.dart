import "package:flutter/material.dart";
import 'package:maktabati/app/containers/teachers/screens/access/components/body.dart';

class AccessSecreen extends StatelessWidget {
  const AccessSecreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AccessBody(),
    );
  }
}