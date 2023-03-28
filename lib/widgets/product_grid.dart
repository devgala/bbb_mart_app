import 'package:bbb_mart/providers/products_provider.dart';
import 'package:bbb_mart/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'newProdCard.dart';

class ProductGrid extends StatelessWidget {
  bool showfavs;
  ProductGrid(this.showfavs);
  @override
  Widget build(BuildContext context) {
    final product_provider = Provider.of<ProductsProvider>(
        context); //Listener(only this widget gets rebuilt
    //when there is change to original list )

    var productList = product_provider.productList;
    if(showfavs){
      productList = productList.where((element) => element.isFavourite).toList();
    }
    var deviceHeight = MediaQuery.of(context).size.height;
    return GridView.builder(
      padding:  EdgeInsets.fromLTRB(deviceHeight*0.01, deviceHeight*0.02, deviceHeight*0.01, 0),
      itemCount: productList.length,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.5  ,
          crossAxisSpacing: (MediaQuery.of(context).size.height)*0.02,
          mainAxisSpacing: (MediaQuery.of(context).size.height)*0.02),

      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
  //use .value constructor for providing existing objects and 'create :' for providing new objects
        //.value also cleans up old data if you navigate to new screen to avoid memory leaks
        value:  productList[i],
        child: newProdCard(),
      ),
    );
  }
}
