import 'package:bbb_mart/providers/products_provider.dart';
import 'package:bbb_mart/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final product_provider = Provider.of<ProductsProvider>(context); //Lisenter(only this widget gets rebuilt
                                                                      //when there is change to original list )
    final productList = product_provider.productList;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2/2,crossAxisSpacing: 10,mainAxisSpacing:10 ),
        itemBuilder: (ctx,i) => ProductCard(imageUrl: productList[i].imageUrl, id: productList[i].id, title: productList[i].title),
    );
  }

}