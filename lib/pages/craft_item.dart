import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heritage/models/crafts.dart';
import 'package:heritage/pages/events_detail.dart';
import 'package:heritage/pages/masters_detail.dart';
import 'package:heritage/pages/tutorials_detail.dart';
import 'package:heritage/widgets/progress.dart';

class CraftItem extends StatefulWidget {
  final DocumentSnapshot craft;
  final String craftSelected;

  CraftItem({this.craft, this.craftSelected});

  @override
  _CraftItemState createState() => _CraftItemState();
}

class _CraftItemState extends State<CraftItem> {
  Future _mastersData;
  Future _craftEventsData;
  Future _craftTutorialData;

  List<Craft> crafts;

  Future getMasters() async {
    var firestore = Firestore.instance;
    QuerySnapshot craftMasters = await firestore
        .collection("crafts")
        .document(widget.craft.documentID)
        .collection('craftMasters')
        .getDocuments();
    return craftMasters.documents;
  }

  Future getExperiences() async {
    var firestore = Firestore.instance;
    QuerySnapshot craftExperiences = await firestore
        .collection("crafts")
        .document(widget.craft.documentID)
        .collection('craftExperiences')
        .getDocuments();
    return craftExperiences.documents;
  }

  Future getTutorials() async {
    var firestore = Firestore.instance;
    QuerySnapshot craftTutorials = await firestore
        .collection("crafts")
        .document(widget.craft.documentID)
        .collection('craftTutorials')
        .getDocuments();
    return craftTutorials.documents;
  }

  @override
  void initState() {
    super.initState();

    _mastersData = getMasters();
    _craftEventsData = getExperiences();
    _craftTutorialData = getTutorials();
  }

  selectEvent(DocumentSnapshot event) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EventsDetail(event: event)));
  }

  selectMaster(DocumentSnapshot master) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MastersDetail(master: master)));
  }

  selectTutorial(DocumentSnapshot tutorial) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TutorialsDetail(tutorial: tutorial)));
  }

  buildCraftImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.craft.data["mediaUrl"]),
        ),
      ),
    );
  }

  buildCraftDescription() {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Description",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.craft.data["description"],
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ));
  }

  difficultyRating() {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Text(
              "Difficulty",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.craft.data["difficulty"],
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ));
  }

  rarityRating() {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              "Rarity",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.craft.data["rarity"],
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ));
  }

  buildCraftRatings() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        difficultyRating(),
        rarityRating(),
      ],
    );
  }

buildGalleryHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16,8,0,0),
      child:Text(
              "Craft Gallery",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ));
  }

  buildCraftGallery() {
    return Container(
        width: double.infinity,
        height: 250,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.craft.data["craftMedia1"]),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(width: 8),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.craft.data["craftMedia2"]),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(width: 8),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.craft.data["craftMedia3"]),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
              ),
            ),
          ],
        ));
  }


  buildCraftEvents(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Text(
            "Experiences",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          FutureBuilder(
              future: _craftEventsData,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                } return Container(
                    height: 245,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () => selectEvent(snapshot.data[index]),
                              child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 8, 12, 0),
                                  width: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
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
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          snapshot.data[index].data["title"],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .accentColor),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          snapshot.data[index].data["country"],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Theme.of(context)
                                                  .accentColor),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          snapshot.data[index].data["date"],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Theme.of(context)
                                                  .accentColor),
                                        ),
                                      ),
                                    ],
                                  )));
                        }));
              })]));
  }

  buildCraftMastersImage(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Text(
            "Masters",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          FutureBuilder(
              future: _mastersData,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                return Container(
                    height: 205,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              margin: const EdgeInsets.fromLTRB(0, 8, 12, 8),
                              width: 150,
                              child: GestureDetector(
                                  onTap: () =>
                                      selectMaster(snapshot.data[index]),
                                  child: Column(
                                    children: <Widget>[
                                      new Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: new BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: new DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(snapshot
                                                    .data[index]
                                                    .data["mediaUrl"])),
                                          ),
                                          //margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4, 8, 0, 0),
                                        child: Text(
                                          snapshot.data[index].data["name"],
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .accentColor),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              4, 8, 0, 0),
                                          child: FlatButton(
                                            onPressed: null,
                                            child: Text('View Maker',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor)),
                                            textColor:
                                                Theme.of(context).primaryColor,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    width: 1,
                                                    style: BorderStyle.solid),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                          )),
                                    ],
                                  )));
                        }));
              })
        ]));
  }

  buildCraftTutorials(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 0, 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Text(
            "Tutorials",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          FutureBuilder(
              future: _craftTutorialData,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                return Container(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () => selectTutorial(snapshot.data[index]),
                              child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 8, 12, 8),
                                  width: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
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
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          snapshot.data[index].data["title"],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .accentColor),
                                        ),
                                      ),
                                    ],
                                  )));
                        }));
              })
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.craft.data["title"],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          buildCraftImage(),
          buildCraftDescription(),
          buildCraftRatings(),
          buildGalleryHeader(),
          buildCraftGallery(),
          buildCraftEvents(context),
          buildCraftMastersImage(context),
          buildCraftTutorials(context)
        ],
      ),
    );
  }
}
