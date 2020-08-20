import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heritage/main.dart';
import 'package:heritage/pages/events_detail.dart';
import 'package:heritage/widgets/drawer.dart';
import 'package:heritage/widgets/header.dart';
//import 'package:heritage/pages/home_page.dart';
import 'package:heritage/widgets/progress.dart';
//import 'package:heritage/widgets/drawer.dart';
//import 'package:heritage/widgets/header.dart';

class EventsPage extends StatefulWidget {
  static const routeName = '/eventsPage';

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  Future _eventsData;
  Future getEvents() async {
    var firestore = Firestore.instance;

    QuerySnapshot exploreEvents =
        await firestore.collection("events").getDocuments();

    return exploreEvents.documents;
  }

  @override
  void initState() {
    super.initState();
    _eventsData = getEvents();
  }

  selectEvent(DocumentSnapshot event) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EventsDetail(event: event)));
  }

  buildEvents(BuildContext context) {
    return FutureBuilder(
        future: _eventsData,
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
                      onTap: () => selectEvent(snapshot.data[index]),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      snapshot.data[index].data["rarity"],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      snapshot.data[index].data["country"],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Theme.of(context).accentColor),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      snapshot.data[index].data["date"],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Theme.of(context).accentColor),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                    );
                  }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, titleText: "Explore experiences"),
        drawer: MainDrawer(),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Check out these craft experiences",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  "Discover experiences to help you learn skills and techniques from the masters that practice these crafts.",
                  style: TextStyle(
                      fontSize: 14.0, color: Theme.of(context).accentColor),
                ),
              ),
              buildEvents(context),
            ],
          ),
        ));
  }
}
