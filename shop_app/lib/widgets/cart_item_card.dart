import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import '../models/cart_item.dart';

// Providers
import '../providers/cart.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final String productId;

  CartItemCard(this.item, this.productId);

  Widget renderCard({@required Widget child, Color background}) {
    return Card(
      color: background,
      child: child,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      background: renderCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: ListTile(
            trailing: Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        background: Theme.of(context).errorColor,
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to remove the item from the cart?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text('Yes'),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: renderCard(
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
      ),
    );
  }
}
