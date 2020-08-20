import 'package:cloud_firestore/cloud_firestore.dart';

class Craft {
  final String craftId;
  final String title;
  final String description;
  final String mediaUrl;
  final String category;
  final String difficulty;
  final String rarity;
  final List similar;

  Craft({
    this.craftId,
    this.title,
    this.description,
    this.mediaUrl,
    this.category,
    this.difficulty,
    this.rarity,
    this.similar,
  });

  factory Craft.fromDocument(DocumentSnapshot doc) {
    return Craft(
      craftId: doc['craftId'],
      title: doc['title'],
      description: doc['description'],
      mediaUrl: doc['mediaUrl'],
      category: doc['category'],
      difficulty: doc['difficulty'],
      rarity: doc['rarity'],
      similar: doc['similar'],
    );
  }
}
