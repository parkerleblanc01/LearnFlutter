import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Models
import '../models/order_item.dart';

class OrderItemCard extends StatelessWidget {
  final OrderItem order;

  OrderItemCard(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(order.dataTime),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
