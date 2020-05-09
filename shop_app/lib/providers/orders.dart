import 'package:flutter/foundation.dart';

// Models
import '../models/order_item.dart';
import '../models/cart_item.dart';

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return new List<OrderItem>.from(_orders);
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        dataTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
