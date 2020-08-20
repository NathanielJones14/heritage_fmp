import 'package:flutter/material.dart';
import 'package:heritage/widgets/header.dart';

class GetStarted extends StatelessWidget {
  static const routeName = '/getStarted';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, titleText: "Getting Started"),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
              Text(
                "Interested in the crafts we are curating? Fancy learning a new hobby? Want to share your skills? Want to join a community of like-minded craft enthusiasts? Heritage is the right platform for you.",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "To get started have a look around our application. Learn about heritage crafts, learn a new skill through the tutorials or find a craft event to join.",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(
                height: 12,
              ),
 Container(
                    height: 240,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("https://remezcla.com/wp-content/uploads/2016/10/1-slide-bolivia-andean-tapestry-traditional-weaving-pano-1150x627.jpg?x95036"),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter),
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                  ),
              SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "1. Explore crafts, experiences and masters to find a craft for you.",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "2. Get involved in the craft through tutorials and experiences.",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "3. Learn the skills needed for the craft and practice. Become a Master.",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "4. Spread the word and teach others your skills. Get them fascinated by heritage crafts.",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "5. Finally, make the craft your own. Put your spin on the craft and make your mark.",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ])));
  }
}
