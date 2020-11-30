import 'package:flutter/material.dart';
import 'package:maktabati/app/containers/teachers/screens/create/create_screen.dart';
import 'package:maktabati/constants.dart';
import 'package:maktabati/icons.dart';
import 'package:masonry_grid/masonry_grid.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({Key key}) : super(key: key);

  @override
  _AddNewScreenState createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  List choises;
  String selectedAction = "";
  @override
  void initState() {
    super.initState();
    choises = [
      {
        "title": "NoteBook",
        "action": addNoteBook,
      },
      {
        "title": "Book",
        "action": addBook,
      },
      {
        "title": "Cover",
        "action": addCover,
      }
    ];
    setState(() {
      choises = choises;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.fromLTRB(0, 100, 0, 90),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: MasonryGrid(
                      column: 2,
                      children: List.generate(
                        choises.length == null ? 0 : choises.length,
                        (i) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedAction = choises[i]["action"];
                              });
                            },
                            child: Container(
                              height: 200,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: selectedAction == choises[i]["action"]
                                      ? Border.all(
                                          width: 2,
                                          color: kPrimaryColor,
                                        )
                                      : null,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 20,
                                      color:
                                          Color(0xFFB0CCE1).withOpacity(0.32),
                                    ),
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 28, 15, 0),
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontFamily: rBold,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: "Add New" + "\n",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: rMedium,
                                                ),
                                              ),
                                              choises[i]['title'].toString() ==
                                                      "Cover"
                                                  ? TextSpan(
                                                      text: "NoteBook" + "\n",
                                                      style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  : TextSpan(),
                                              TextSpan(
                                                text: choises[i]['title'],
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: choises[i]["title"] == "NoteBook"
                                            ? BsNotBook(
                                                size: 40,
                                                color: Colors.black,
                                              )
                                            : choises[i]["title"] == "Book"
                                                ? BsBook(
                                                    size: 40,
                                                    color: Colors.black,
                                                  )
                                                : BsBookCover(
                                                    size: 40,
                                                    color: Colors.black,
                                                  ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned.fill(
              bottom: 0,
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height - 90,
              child: Container(
                width: double.infinity,
                height: 90,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 20,
                        color: Color(0xFFB0CCE1).withOpacity(0.32),
                      ),
                    ],
                  ),
                  child: Container(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color: Colors.grey[200],
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
                                  child: Icon(
                                    Icons.arrow_back,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            width: MediaQuery.of(context).size.width - 100,
                            decoration: BoxDecoration(
                                color: selectedAction == ""
                                    ? kPrimaryColor.withOpacity(0.3)
                                    : kPrimaryColor,
                                borderRadius: BorderRadius.circular(6)),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  if (selectedAction != "") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return CreateScreen(
                                          type: selectedAction,
                                        );
                                      }),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      BsArrowRight(
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Next",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: rBold,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
