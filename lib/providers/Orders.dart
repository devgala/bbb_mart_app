import 'package:flutter/material.dart';

import 'cart.dart' show CartItem;

class OrderItem {
  final String id;
  final double totalAmt;
  final List<CartItem> cartItems;
  final DateTime dateTime;
  bool isPaid = false;
  OrderItem(
      {required this.id,
      required this.cartItems,
      required this.dateTime,
      required this.totalAmt,});
}

class Orders extends ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get getOrders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartItem, double totalAmt) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toIso8601String(),
            cartItems: cartItem,
            dateTime: DateTime.now(),
            totalAmt: totalAmt));
    notifyListeners();
  }

  void changePaidStatus(String orderItemId){
    var orderItemIndex = _orders.indexWhere((element) => element.id == orderItemId);
    var orderItem = _orders[orderItemIndex];

    orderItem.isPaid = !orderItem.isPaid;
    _orders.insert(orderItemIndex, orderItem);
    notifyListeners();

  }
  int get getUnpaidCount{
    int count =0;
    for(int i=0;i<_orders.length;i++){
      if(!_orders[i].isPaid) count++;
    }
    return count;
  }
}
