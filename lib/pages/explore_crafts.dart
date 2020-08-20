import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heritage/pages/craft_item.dart';
import 'package:heritage/widgets/progress.dart';
import 'package:heritage/widgets/drawer.dart';
import 'package:heritage/widgets/header.dart';

class ExploreCrafts extends StatefulWidget {
  static const routeName = '/exploreCrafts';

  @override
  _ExploreCraftsState createState() => _ExploreCraftsState();
}

class _ExploreCraftsState extends State<ExploreCrafts> {
  Future _craftData;
  Future getCrafts() async {
    var firestore = Firestore.instance;

    QuerySnapshot exploreCrafts =
        await firestore.collection("crafts").getDocuments();

    return exploreCrafts.documents;
  }

  @override
  void initState() {
    super.initState();
    _craftData = getCrafts();
  }

  selectTutorial(DocumentSnapshot craft) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CraftItem(craft: craft)));
  }

  buildCraftList(BuildContext context) {
    return FutureBuilder(
        future: _craftData,
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
                            width: 180,
                            margin: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 220,
                                    decoration: BoxDecoration(
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
                                        const EdgeInsets.fromLTRB(0, 8, 16, 0),
                                    child: Text(
                                      snapshot.data[index].data["title"],
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 16, 8),
                                        child: Text(
                                          snapshot.data[index].data["category"],
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 16, 8),
                                        child: Text(
                                          snapshot.data[index].data["rarity"],
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                      ),
                                    ],
                                  )
                                ])));
                  }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, titleText: "Explore crafts"),
        drawer: MainDrawer(),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Explore and learn",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  "Discover traditional crafts that have been practiced for hundreds of years. Learn their unique techniques and applications.",
                  style: TextStyle(
                      fontSize: 14.0, color: Theme.of(context).accentColor),
                ),
              ),
              buildCraftList(context),
            ],
          ),
        ));
  }
}
