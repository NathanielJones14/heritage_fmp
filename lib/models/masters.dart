import 'package:cloud_firestore/cloud_firestore.dart';

class Masters {
  final String name;
  final String username;
  final String mediaUrl;

  Masters({
    this.name,
    this.username,
    this.mediaUrl,
  });

  factory Masters.fromDocument(DocumentSnapshot doc) {
    return Masters(
      name: doc['name'],
      username: doc['username'],
      mediaUrl: doc['mediaUrl'],
    );
  }
}
