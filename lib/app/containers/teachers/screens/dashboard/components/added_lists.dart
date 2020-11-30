import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/teachers/screens/dashboard/components/added_item.dart';

class AddedLists extends StatefulWidget {
  AddedLists({Key key}) : super(key: key);

  @override
  _AddedListsState createState() => _AddedListsState();
}

class _AddedListsState extends State<AddedLists> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          AddedItem(
            press: (){
              
            },
          ),
        ],
      ),
    );
  }
}
