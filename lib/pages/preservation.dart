import 'package:flutter/material.dart';
import 'package:heritage/pages/preservation_categories/critically_endangered.dart';
import 'package:heritage/pages/preservation_categories/endangered.dart';
import 'package:heritage/pages/preservation_categories/extinct.dart';
import 'package:heritage/pages/preservation_categories/safe.dart';
import 'package:heritage/widgets/drawer.dart';
import 'package:heritage/widgets/header.dart';

class Preservation extends StatefulWidget {
  static const routeName = '/preservation';

  @override
  _PreservationState createState() => _PreservationState();
}

class _PreservationState extends State<Preservation> {


  buildExtinctCategory() {
    return GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ExtinctList())),
        child: Container(
            margin: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Extinct Crafts",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://robbreportedit.files.wordpress.com/2020/03/marino-menegazzo-02.jpg"),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                  ),
                ])));
  }

  buildCriticallyEndangeredCategory() {
    return GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CriticallyEndageredList())),
        child: Container(
            margin: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Critically Endangered Crafts",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://static01.nyt.com/images/2019/11/19/travel/19trending-crafts1/19trending-crafts1-superJumbo.jpg?quality=90&auto=webp"),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                  ),
                ])));
  }

  buildEndangeredCategory() {
    return GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EndageredList())),
        child: Container(
            margin: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Endangered Crafts",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://robbreportedit.files.wordpress.com/2020/03/pedro-da-costa-felgueiras.jpg?w=660"),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                  ),
                ])));
  }

  buildSafeCategory() {
    return GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SafeList())),
        child: Container(
            margin: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Safe Crafts",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://robbreportedit.files.wordpress.com/2020/03/chiara-vigo-002.jpg"),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                  ),
                ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, titleText: "Preservation"),
        drawer: MainDrawer(),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Text(
                "Explore in-danger crafts",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  "Discover what heritage crafts are in need of new makers to pass their skills onto the next generation.",
                  style: TextStyle(
                      fontSize: 16.0, color: Theme.of(context).accentColor),
                ),
              ),
              buildExtinctCategory(),
              buildCriticallyEndangeredCategory(),
              buildEndangeredCategory(),
              buildSafeCategory(),
            ],
          ),
        ));
  }
}
