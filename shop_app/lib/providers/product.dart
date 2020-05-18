import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  static Product fromMap({@required String newId, @required Map<String, dynamic> map}) {
    return new Product(
      id: newId,
      title: map['title'],
      description: map['description'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      isFavorite: map['isFavorite'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'isFavorite': isFavorite,
    };
  }

  Product newModifiedProduct(
      {String id,
      String title,
      String description,
      double price,
      String imageUrl,
      bool isFavorite}) {
    return Product(
      id: id != null ? id : this.id,
      title: title != null ? title : this.title,
      description: description != null ? description : this.description,
      price: price != null ? price : this.price,
      imageUrl: imageUrl != null ? imageUrl : this.imageUrl,
      isFavorite: isFavorite != null ? isFavorite : this.isFavorite,
    );
  }

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
