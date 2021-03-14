import 'package:flutter/foundation.dart';
import 'package:shop_app/providers/cart.dart';

class OrderItem {
  final String id;
  final List<CartItem> products;
  final double totalAmount;
  final DateTime date;

  OrderItem(
      {@required this.id,
      @required this.products,
      @required this.totalAmount,
      @required this.date});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder({List<CartItem> products, double total}) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        products: products,
        totalAmount: total,
        date: DateTime.now(),
      ),
    );
  }
}
