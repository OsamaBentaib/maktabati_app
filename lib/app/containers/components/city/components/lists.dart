import 'package:flutter/material.dart';
import 'package:maktabati/app/connections/models/cities.dart';
import 'package:maktabati/app/containers/components/city/components/items.dart';
import 'package:maktabati/app/containers/components/school/school_screen.dart';

class ListItems extends StatelessWidget {
  final String isFor;
  final List<Cities> snapshot;
  const ListItems({Key key, this.isFor, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Container()
      ),
    );
  }
}
