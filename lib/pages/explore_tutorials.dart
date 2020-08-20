import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heritage/main.dart';
//import 'package:heritage/pages/home_page.dart';
import 'package:heritage/pages/tutorials_detail.dart';
import 'package:heritage/widgets/drawer.dart';
import 'package:heritage/widgets/header.dart';
import 'package:heritage/widgets/progress.dart';
//import 'package:heritage/widgets/drawer.dart';
//import 'package:heritage/widgets/header.dart';

class ExploreTutorials extends StatefulWidget {
  static const routeName = '/exploreTutorials';

  @override
  _ExploreTutorialsState createState() => _ExploreTutorialsState();
}

class _ExploreTutorialsState extends State<ExploreTutorials> {
  Future _tutorialData;
  Future getTutorials() async {
    var firestore = Firestore.instance;

    QuerySnapshot exploreTutorials =
        await firestore.collection("tutorials").getDocuments();

    return exploreTutorials.documents;
  }

  @override
  void initState() {
    super.initState();
    _tutorialData = getTutorials();
  }

  selectTutorial(DocumentSnapshot tutorial) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TutorialsDetail(tutorial: tutorial)));
  }

  buildTutorials(BuildContext context) {
    return FutureBuilder(
        future: _tutorialData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          return Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () => selectTutorial(snapshot.data[index]),
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 8, 12, 8),
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot
                                          .data[index].data["mediaUrl"]),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        new BorderRadius.circular(8.0),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  child: Text(
                                    snapshot.data[index].data["title"],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  child: Text(
                                    snapshot.data[index].data["category"],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ),
                              ],
                            )));
                  }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, titleText: "Explore tutorials"),
        drawer: MainDrawer(),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Check out these tutorials",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: 8,),
              Text(
                "Explore tutorials of heritage crafts that will help you to learn the basics of the skills necessary to perform these crafts.",
                style: TextStyle(
                    fontSize: 14.0,
                    color: Theme.of(context).primaryColor),
              ),
              buildTutorials(context),
            ],
          ),
        ));
  }
}
