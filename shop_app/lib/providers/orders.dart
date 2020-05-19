import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Models
import '../models/order_item.dart';
import '../models/cart_item.dart';

// Providers
import '../providers/products.dart';

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return new List<OrderItem>.from(_orders);
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final newOrder = OrderItem(
      id: null,
      amount: total,
      dateTime: DateTime.now(),
      products: cartProducts,
    );
    final response = await http.post(
      "${Products.baseUrl}/orders.json",
      body: json.encode(newOrder.toMap()),
    );
    _orders.insert(
      0,
      newOrder.newModifiedOrder(id: json.decode(response.body)['name']),
    );
    notifyListeners();
  }
}
