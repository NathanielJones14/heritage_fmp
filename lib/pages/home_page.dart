import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:heritage/models/crafts.dart';
import 'package:heritage/pages/craft_item.dart';
import 'package:heritage/pages/events_detail.dart';
import 'package:heritage/pages/get_started.dart';
import 'package:heritage/pages/masters_detail.dart';
import 'package:heritage/pages/mission.dart';
import 'package:heritage/widgets/drawer.dart';
//import 'package:heritage/pages/home.dart';
import 'package:heritage/widgets/progress.dart';
import 'package:heritage/widgets/header.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;
  

  Future _data;
  Future _mastersData;
  Future _eventData;

  
  Future getCrafts() async {
    var firestore = Firestore.instance;

    QuerySnapshot suggestedCrafts =
        await firestore.collection("crafts").getDocuments();

    return suggestedCrafts.documents;
  }

   Future getEvents() async {
   var firestore = Firestore.instance;

   QuerySnapshot exploreEvents = await firestore.collection("events").getDocuments();

   return exploreEvents.documents;

 }

  Future getMasters() async {
    var firestore = Firestore.instance;

    QuerySnapshot craftMasters =
        await firestore.collection("masters").getDocuments();

    return craftMasters.documents;
  }


  selectCraft(DocumentSnapshot craft) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CraftItem(craft: craft)));
  }

  selectEvent(DocumentSnapshot event) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EventsDetail(event: event)));
  }

  selectMaster(DocumentSnapshot master) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MastersDetail(master: master)));
  }

  @override
  void initState() {
    super.initState();

    _data = getCrafts();
    _mastersData = getMasters();
    _eventData = getEvents();
  }

  buildSuggestedCrafts(BuildContext context) {
    return FutureBuilder(
        future: _data,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          return Container(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () => selectCraft(snapshot.data[index]),
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 8, 12, 8),
                            width: 220,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 170,
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
                              ],
                            )));
                  }));
        });
  }

  buildCraftMastersImage(BuildContext context) {
    return FutureBuilder(
        future: _mastersData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          return Container(
              height: 225,
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
                                offset:
                                    Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        margin: const EdgeInsets.fromLTRB(0, 8, 12, 8),
                        width: 150,
                        child: GestureDetector(
                            onTap: () => selectMaster(snapshot.data[index]),
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
                                              .data[index].data["mediaUrl"])),
                                    ),
                                    //margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 8, 0, 0),
                                  child: Text(
                                    snapshot.data[index].data["name"],
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 8, 0, 0),
                                  child: Text(
                                    snapshot.data[index].data["crafts"],
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 8, 0, 0),
                                    child: FlatButton(
                                      onPressed: null,
                                      child: Text('View Maker',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                      textColor: Theme.of(context).primaryColor,
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
        });
  }

  buildSuggestedExperiences(BuildContext context) {
    return FutureBuilder(
        future: _eventData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          return Container(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => selectEvent(snapshot.data[index]),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 12, 8),
                        width: 180,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 150,
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
                                    image: NetworkImage(
                                        snapshot.data[index].data["mediaUrl"]),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.rectangle,
                                  borderRadius: new BorderRadius.circular(8.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
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
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  snapshot.data[index].data["rarity"],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  snapshot.data[index].data["country"],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Theme.of(context).accentColor),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  snapshot.data[index].data["date"],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Theme.of(context).accentColor),
                                ),
                              ),
                            ]),
                      ),
                    );
                  }));
        });
  }

  heritageValues() {
    return Container(
        height: 120,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, OurMission.routeName),
                  child: Container(
                    height: 120,
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      shape: BoxShape.rectangle,
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Our Mission",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                flex: 2,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, GetStarted.routeName),
                  child: Container(
                    height: 120,
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "How to get started",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                flex: 2,
              ),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: header(context, isAppTitle: true),
        drawer: MainDrawer(),
        body: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "Suggested Crafts",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                buildSuggestedCrafts(context),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Text(
                    "Crafts Masters",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                buildCraftMastersImage(context),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Text(
                    "Experiences",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                buildSuggestedExperiences(context),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 8),
                  child: Text(
                    "Learn about our values",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                heritageValues(),
              ],
            )));
  }
}
