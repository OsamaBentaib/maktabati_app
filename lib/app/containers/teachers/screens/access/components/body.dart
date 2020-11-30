import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/teachers/screens/access/components/access_form.dart';
import 'package:maktabati/constants.dart';

class AccessBody extends StatefulWidget {
  AccessBody({Key key}) : super(key: key);

  @override
  _AccessBodyState createState() => _AccessBodyState();
}

class _AccessBodyState extends State<AccessBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AccessForm(),
    );
  }
}
