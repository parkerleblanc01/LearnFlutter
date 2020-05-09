import 'package:flutter/foundation.dart';

// Models
import './cart_item.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dataTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dataTime,
  });
}
