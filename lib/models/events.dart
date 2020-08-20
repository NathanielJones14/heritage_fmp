import 'package:cloud_firestore/cloud_firestore.dart';

class Events {
  final String title;
  final String date;
  final String mediaUrl;
  final String country;
  final String rarity;

  Events({
    this.title,
    this.date,
    this.mediaUrl,
    this.country,
    this.rarity,
  });

  factory Events.fromDocument(DocumentSnapshot doc) {
    return Events(
      title: doc['title'],
      date: doc['date'],
      mediaUrl: doc['mediaUrl'],
      country: doc['country'],
      rarity: doc['rarity'],
    );
  }
}
