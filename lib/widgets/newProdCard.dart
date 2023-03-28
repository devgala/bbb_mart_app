import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class newProdCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    // TODO: implement build
    // Generated code for this Column Widget...

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, ProductDetailScreen.routeName,
                        arguments: product.id);
                  },
                  child: Image.network(
                    product.imageUrl,
                    width: (MediaQuery.of(context).size.width) * 0.4,
                    height: (MediaQuery.of(context).size.height) * 0.15,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  right: -6,
                  top: -5,
                  child: Container(
                      padding: const EdgeInsets.all(2.0),
                      // color: Theme.of(context).accentColor,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10.0),
                      //   //color: color != null ? color : Theme.of(context).accentColor,
                      // ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: (product.isFavourite)
                          ? IconButton(
                              onPressed: () {
                                product.toggleFavourite();
                              },
                              icon: Icon(Icons.favorite),
                              color: Color.fromRGBO(209, 0, 0, 0.7))
                          : IconButton(
                              onPressed: () {
                                product.toggleFavourite();
                              },
                              icon: Icon(Icons.favorite_border_outlined),
                              color: Color.fromRGBO(209, 0, 0, 0.7))),
                )
              ]),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.01,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Container(
                      child: Text(
                        product.title,
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Text(
                    "\$${product.price.toString()}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () {
                  cart.addItems(product.id, product.title, product.price);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                child: Text("Add to Cart"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
