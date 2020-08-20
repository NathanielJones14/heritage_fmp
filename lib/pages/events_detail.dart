import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:heritage/widgets/progress.dart';

class EventsDetail extends StatefulWidget {
  static const routeName = '/eventsDetail';

  final DocumentSnapshot event;

  EventsDetail({this.event});

  @override
  _EventsDetailState createState() => _EventsDetailState();
}

class _EventsDetailState extends State<EventsDetail> {
  buildEventImage() {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: 240,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.event.data["mediaUrl"]),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(8.0),
          ),
        ));
  }

  buildEventDescription() {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
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
              widget.event.data["description"],
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ));
  }

  buildCost() {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          children: <Widget>[
            Text(
              "Cost",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              widget.event.data["cost"],
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ));
  }

  buildLocation() {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          children: <Widget>[
            Text(
              "Location",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              widget.event.data["location"],
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ));
  }

  buildDate() {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          children: <Widget>[
            Text(
              "Date",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              widget.event.data["date"],
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ));
  }

  buildTime() {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          children: <Widget>[
            Text(
              "Time",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              widget.event.data["time"],
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.event.data["title"],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildEventImage(),
          buildEventDescription(),
          buildDate(),
          buildTime(),
          buildLocation(),
          buildCost(),
          SizedBox(height: 16,),
        ],
      ),
    );
  }
}
