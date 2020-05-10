import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers
import '../providers/orders.dart';

// Widgets
import '../widgets/order_item_card.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) => OrderItemCard(orderData.orders[index]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
