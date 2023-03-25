
import 'package:bbb_mart/DUMMY_DATA.dart';
import 'package:flutter/cupertino.dart';

import 'product.dart';

class ProductsProvider with ChangeNotifier{
  final List <Product> _product_list = dummy_list;

  List <Product> get productList{
    return [..._product_list]; // gives copy of product_list rather than pointer to actual list
  }
  Product getItemById(String id){
    return _product_list.firstWhere((element) => element.id == id);
  }
}