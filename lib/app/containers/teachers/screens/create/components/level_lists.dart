import 'package:flutter/material.dart';
import 'package:maktabati/app/connections/API/api_connection.dart';
import 'package:maktabati/app/containers/parents/screens/level/components/card_item.dart';
import 'package:maktabati/app/containers/parents/screens/level/components/card_title.dart';
import 'package:maktabati/constants.dart';

class LevelLists extends StatefulWidget {
  final Function press;
  String selectedLevel;
  LevelLists({Key key, this.press, this.selectedLevel}) : super(key: key);
  @override
  _LevelListsState createState() => _LevelListsState(press, selectedLevel);
}

class _LevelListsState extends State<LevelLists> {
  final Function press;
  String selectedLevel;
  _LevelListsState(this.press, this.selectedLevel);
  List levels;
  _onFetchLevels() async {
    APIConnect().getTeacherLevel().then((value) {
      print(value.body);
    }).catchError((onError) => print(onError));
  }

  @override
  void initState() {
    super.initState();
    _onFetchLevels();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 20,
                color: Color(0xFFB0CCE1).withOpacity(0.32),
              ),
            ],
          ),
          child: ListView.builder(
              itemCount: levels != null ? levels.length + 1 : 0,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return CardTitle(
                    title: "High School",
                  );
                }
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: selectedLevel == levels[index]["_id"]
                        ? kBackroundColor
                        : null,
                  ),
                  child: InkWell(
                    onTap: press(),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                      child: Text(
                        "1 ere annee de Bac",
                        style: TextStyle(
                            fontFamily: rLight,
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
