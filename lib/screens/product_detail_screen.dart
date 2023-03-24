import 'package:bbb_mart/DUMMY_DATA.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget{
  static const routeName = '/ProductDetailScreen';
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)?.settings.arguments as String;
    final product = dummy_list.firstWhere((element) => element.id == productID);
  return Scaffold(

    appBar: AppBar(title: Text(product.title),backgroundColor: Theme.of(context).accentColor),

  );
  }
  
}