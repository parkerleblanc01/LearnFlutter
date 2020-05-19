import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'quantity': quantity,
      'price': price
    };
  }

  static CartItem fromMap(
      {@required Map<String, dynamic> map}) {
    return new CartItem(
      id: map['id'],
      title: map['title'],
      quantity: map['quantity'],
      price: map['price'],
    );
  }
}