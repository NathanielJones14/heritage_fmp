import 'package:flutter/material.dart';
import 'package:heritage/widgets/header.dart';

class OurMission extends StatelessWidget {
  static const routeName = '/ourMission';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, titleText: "Our Mission"),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Text(
                "At Heritage our aim is to transform the way we think about heritage crafts and we aim to promote the passing of skills and knowledge between makers, whilst whilst creating a community that fosters sharing and the archiving of these traditional skills.",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Heritage aims to connect those with skills, and knowledge, with those who wish to learn. Heritage also helps promote the connection between distant makers to help break down barriers and promote the practice of heritage crafts across the United Kingdom. ",
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
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1477764864052-f721644f01a8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80"),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(8.0),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Our Values",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Heritage craft is vital to our cultural identity.",
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
                    "Crafts should be passed on to the next generation of makers.",
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
                    "Connecting the community of makers is key to these crafts survival.",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                    height: 16,
                  ),
              Text(
                "We are looking to work with heritage craftspeople across the United Kingdom to showcase their craft, skills and passion.",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ));
  }
}
