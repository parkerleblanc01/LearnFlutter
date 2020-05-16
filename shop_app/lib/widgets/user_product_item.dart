import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screens
import '../screens/edit_product_screen.dart';

// Providers
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  EditProductScreen.routeName,
                  arguments: id,
                );
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Are you sure?'),
                    content: Text('Do you want to delete this product?'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: Text('No'),
                      ),
                      FlatButton(
                        onPressed: () {
                          Provider.of<Products>(context, listen: false).deleteProduct(id);
                          Navigator.of(ctx).pop(true);
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
