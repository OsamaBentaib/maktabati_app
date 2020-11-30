import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/teachers/screens/create/components/add_book.dart';
import 'package:maktabati/app/containers/teachers/screens/create/components/add_notebook_cover.dart';
import 'package:maktabati/app/containers/teachers/screens/create/components/add_note_book.dart';
import 'package:maktabati/constants.dart';

class CreateScreen extends StatelessWidget {
  final String type;
  const CreateScreen({Key key, this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: type == addBook
          ? AddBook()
          : type == addCover ? AddNoteBookCover() : AddNoteBook(),
    );
  }
}
