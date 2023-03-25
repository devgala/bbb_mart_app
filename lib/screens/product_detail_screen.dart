import 'package:bbb_mart/DUMMY_DATA.dart';
import 'package:bbb_mart/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget{
  static const routeName = '/ProductDetailScreen';
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)?.settings.arguments as String;
    final product = Provider.of<ProductsProvider>(
        context,
      //listen: false, //is listen is set to false widget wont be rebuilt whenever data changes
                        // use for widgets where you dont have much change in data

    ).getItemById(productID);
  return Scaffold(

    appBar: AppBar(title: Text(product.title),backgroundColor: Theme.of(context).accentColor),

  );
  }
  
}