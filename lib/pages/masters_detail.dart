import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MastersDetail extends StatefulWidget {
  static const routeName = '/mastersDetail';
  final DocumentSnapshot master;

  MastersDetail({this.master});

  @override
  _MastersDetailState createState() => _MastersDetailState();
}

class _MastersDetailState extends State<MastersDetail> {
  buildMasterImage() {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: 240,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.master.data["mediaUrl"]),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter),
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(8.0),
          ),
        ));
  }

  buildMasterDescription() {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Description",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.master.data["description"],
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ));
  }

  buildCrafts() {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Specialism",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.master.data["crafts"],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }

  buildMasterSkills() {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Other Skills",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.master.data["otherSpecialisms"],
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ));
  }

  buildMasterGalleryHeader() {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
        child: Text(
          "Maker's gallery",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ));
  }

  buildMastersCraftGallery() {
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
                  image: NetworkImage(widget.master.data["craftMedia1"]),
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
                  image: NetworkImage(widget.master.data["craftMedia2"]),
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
                  image: NetworkImage(widget.master.data["craftMedia3"]),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
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
          widget.master.data["name"],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          buildMasterImage(),
          buildCrafts(),
          SizedBox(height: 8),
          buildMasterSkills(),
          SizedBox(height: 4),
          buildMasterDescription(),
          SizedBox(height: 8),
          buildMasterGalleryHeader(),
          buildMastersCraftGallery(),
        ],
      ),
    );
  }
}
