//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heritage/pages/events_detail.dart';
import 'package:heritage/pages/explore_tutorials.dart';
import 'package:heritage/pages/get_started.dart';
import 'package:heritage/pages/home_page.dart';
import 'package:heritage/pages/masters_detail.dart';
import 'package:heritage/pages/mission.dart';
import 'package:heritage/pages/explore_crafts.dart';
import 'package:heritage/pages/profile.dart';
import 'package:heritage/pages/search.dart';
import 'package:heritage/pages/activity_feed.dart';
import 'package:heritage/pages/home.dart';
import 'package:heritage/pages/events_page.dart';
import 'package:heritage/pages/skills_track.dart';
import 'package:heritage/pages/timeline.dart';
import 'package:heritage/pages/upload.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore.instance.settings(timestampsInSnapshotsEnabled: true).then((_) {
    print("Timestamps enabled in snapshots\n");
  }, onError: (_) {
    print("Error enabling timestamps in snapshots\n");
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const routeName = '/myApp';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heritage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff002d2d),
        accentColor: Color(0xff020432),
      ),
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        ActivityFeed.routeName: (ctx) => ActivityFeed(),
        Search.routeName: (ctx) => Search(),
        EventsPage.routeName: (ctx) => EventsPage(),
        Upload.routeName: (ctx) => Upload(),
        Profile.routeName: (ctx) => Profile(),
        SkillsTrack.routeName: (ctx) => SkillsTrack(),
        ExploreCrafts.routeName: (ctx) => ExploreCrafts(),
        OurMission.routeName: (ctx) => OurMission(),
        GetStarted.routeName: (ctx) => GetStarted(),
        ExploreTutorials.routeName: (ctx) => ExploreTutorials(),
        EventsDetail.routeName: (ctx) => EventsDetail(),
        MastersDetail.routeName: (ctx) => MastersDetail(),
        Timeline.routeName: (ctx) => Timeline(),
        MyApp.routeName: (ctx) => MyApp(),
      },
      home: Home(),
    );
  }
}
