import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

import '../widgets/main_drawer.dart';
import '../providers/products.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user_products_screen';

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text('The Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(products[i].imageUrl),
                  ),
                  title: Text(products[i].title),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.edit,
                                color: Theme.of(context).primaryColor),
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(Icons.delete,
                                color: Theme.of(context).errorColor),
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ),
                Divider()
              ],
            );
          },
          itemCount: products.length,
        ),
      ),
    );
  }
}
