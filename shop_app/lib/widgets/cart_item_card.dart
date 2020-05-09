import 'package:flutter/material.dart';

// Models
import '../models/cart_item.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;

  CartItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(child: Text('\$${item.price}')),
            ),
          ),
          title: Text(item.title),
          subtitle: Text('Total: \$${item.price * item.quantity}'),
          trailing: Text('${item.quantity} x'),
        ),
      ),
    );
  }
}
