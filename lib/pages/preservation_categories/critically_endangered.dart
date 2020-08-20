import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heritage/pages/craft_item.dart';
import 'package:heritage/widgets/progress.dart';
import 'package:heritage/widgets/header.dart';

class CriticallyEndageredList extends StatefulWidget {
  static const routeName = '/preservationList';

  @override
  _CriticallyEndageredListState createState() => _CriticallyEndageredListState();
}

class _CriticallyEndageredListState extends State<CriticallyEndageredList> {
  Future _criticallyEndangeredCraftData;
  Future getCriticallyEndangeredCraftData() async {
    var firestore = Firestore.instance;

    QuerySnapshot criticallyEndangeredCrafts =
        await firestore.collection("crafts").where("rarity", isEqualTo: "Critically Endangered").getDocuments();

    return criticallyEndangeredCrafts.documents;
  }

  @override
  void initState() {
    super.initState();
    _criticallyEndangeredCraftData = getCriticallyEndangeredCraftData();
  }

  selectTutorial(DocumentSnapshot craft) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CraftItem(craft: craft)));
  }

  buildCraftTutorials(BuildContext context) {
    return FutureBuilder(
        future: _criticallyEndangeredCraftData,
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
        appBar: header(context, titleText: "Critically Endangered Crafts"),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Critically Endangered Crafts",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  "Crafts classified as critically endangered are those at serious risk of no longer being practised in the UK. They may include crafts with a shrinking base of craftspeople, crafts with limited training opportunities, crafts with low financial viability, or crafts where there is no mechanism to pass on the skills and knowledge.",
                  style: TextStyle(
                      fontSize: 16.0, color: Theme.of(context).accentColor),
                ),
              ),
              buildCraftTutorials(context),
            ],
          ),
        ));
  }
}
