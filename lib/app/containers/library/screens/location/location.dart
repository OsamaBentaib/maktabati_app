import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/library/screens/location/components/body.dart';

class LibraryLocation extends StatelessWidget {
  const LibraryLocation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LocationBody(),
    );
  }
}
