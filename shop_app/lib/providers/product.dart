import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Providers
import '../providers/products.dart';

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

  static Product fromMap(
      {@required String newId, bool isFavorite = false, @required Map<String, dynamic> map}) {
    return new Product(
      id: newId,
      title: map['title'],
      description: map['description'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      isFavorite: isFavorite,
    );
  }

  Map<String, dynamic> toMap(String userId) {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'creatorId': userId,
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

  void toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    var hasError = false;
    try {
      final response = await http.put(
        "${Products.baseUrl}/userFavorites/$userId/$id.json?auth=$token",
        body: json.encode(isFavorite),
      );
      if (response.statusCode >= 400) {
        hasError = true;
      }
    } catch (error) {
      hasError = true;
    }

    if (hasError) {
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}
