import 'package:cloud_firestore/cloud_firestore.dart';

class Tutorials {
  final String title;
  final String mediaUrl;
  final String category;

  Tutorials({
    this.title,
    this.mediaUrl,
    this.category
  });

  factory Tutorials.fromDocument(DocumentSnapshot doc) {
    return Tutorials(
      title: doc['name'],
      mediaUrl: doc['mediaUrl'],
      category: doc['category']
    );
  }
}