import 'package:flutter/foundation.dart';

// Models
import './cart_item.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'products': products.map((cp) => cp.toMap()).toList(),
      'dateTime': dateTime.toIso8601String(),
    };
  }

  static OrderItem fromMap(
      {@required String newId, @required Map<String, dynamic> map}) {
    var cartItems = [];
    map['products'].forEach((cpId, cpData) {
      cartItems.add(CartItem.fromMap(newId: cpId, map: cpData));
    });
    return new OrderItem(
      id: newId,
      amount: map['amount'],
      products: cartItems,
      dateTime: map['dateTime'],
    );
  }

  OrderItem newModifiedOrder(
      {String id,
        double amount,
        List<CartItem> products,
        DateTime dateTime,}) {
    return OrderItem(
      id: id != null ? id : this.id,
      amount: amount != null ? amount : this.amount,
      products: products != null ? products : this.products,
      dateTime: dateTime != null ? dateTime : this.dateTime,
    );
  }
}
