import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heritage/pages/home.dart';
import 'package:heritage/pages/profile.dart';
import 'package:heritage/pages/search.dart';
import 'package:heritage/pages/activity_feed.dart';
import 'package:heritage/pages/timeline.dart';
import 'package:heritage/pages/upload.dart';
class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  final String currentUserId = currentUser?.id;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
                icon,
                size:26.0,
              ),
              title: Text(
                title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Welcome to Heritage', 
            style: TextStyle(
              fontSize: 24.0, 
              fontWeight: FontWeight.bold, 
              color: Colors.white,
              ),
              ),
            ),
            SizedBox(height: 20,),
            buildListTile('Activity Feed', Icons.notifications_active, () {Navigator.of(context).popAndPushNamed(ActivityFeed.routeName);}),
            buildListTile('Search for Users', Icons.search, () {Navigator.of(context).popAndPushNamed(Search.routeName);}),
            buildListTile('Timeline', Icons.collections, () {Navigator.push(context,MaterialPageRoute(builder: (context) => Timeline(currentUser: currentUser)));}), 
            buildListTile('Upload photos', Icons.photo_camera, () {Navigator.push(context,MaterialPageRoute(builder: (context) => Upload(currentUser: currentUser)));}), 
            buildListTile('Profile', Icons.assignment, () {Navigator.push(context,MaterialPageRoute(builder: (context) => Profile(profileId: currentUser?.id)));}),    
        ],
      ),
    );
  }
 }