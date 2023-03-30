import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;
  CartItem(
      {required this.title,
      required this.id,
      required this.price,
      required this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _productCartMap = {};
  Map<String, CartItem> get getcart {
    return {..._productCartMap};
  }

  void addItems(String productID, String title, double price) {
    if (_productCartMap.containsKey(productID)) {
      _productCartMap.update(
          productID,
          (existing_value) => CartItem(
              title: existing_value.title,
              id: existing_value.id,
              price: existing_value.price,
              quantity: existing_value.quantity + 1));
    } else {
      _productCartMap.putIfAbsent(
          productID,
          () => CartItem(
              title: title,
              id: DateTime.now().toString(),
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }

  int get getItemCount {
    return _productCartMap.length;
  }

  double get getTotalAmount {
    double total = 0.0;
    _productCartMap.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void removeItem(String productID) {
    _productCartMap.remove(productID);
    notifyListeners();
  }

  void removeOne(String prodId) {
    if (_productCartMap[prodId]?.quantity != 0) {
      _productCartMap.update(
          prodId,
          (value) => CartItem(
              title: value.title,
              id: value.id,
              price: value.price,
              quantity: value.quantity - 1));
      if(_productCartMap[prodId]?.quantity == 0){
        _productCartMap.remove(prodId);
      }
    } else {
      _productCartMap.remove(prodId);
    }
    notifyListeners();
  }

  void clear(){
    _productCartMap={};
    notifyListeners();
  }
}
