import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';
import '../providers/orders.dart';
import '../widgets/order_item.dart' as orderItem;

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders_screen';

  @override
  Widget build(BuildContext context) {
    final ordersObject = Provider.of<Orders>(context);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return orderItem.OrderItem(order: ordersObject.orders[i]);
        },
        itemCount: ordersObject.orders.length,
      ),
    );
  }
}
