import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,listen: true);
    final cart = Provider.of<Cart>(context);
    /*
    * We can use Consumer<Prodcut>(
    * builder : (context,provider_object(here its product from above),child) => Some Widget
    * ),
    * Consumer widget is used to rebuild only certain parts of widget tree and not whole tree when
    * a change occurs in provider thus increasing efficiency.
    *  child argument is a Widget that can be passed into Consumer constructor and then accessed by the
    * widget you want to build without requiring a rebuild every time the data is updated
    * */
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(product.title, textAlign: TextAlign.center),
          leading: (product.isFavourite)
              ? IconButton(
                  icon: const Icon(Icons.favorite,color: Colors.redAccent,), onPressed: () {
                    product.toggleFavourite();
          })
              : IconButton(
                  icon: const Icon(Icons.favorite_outline_sharp), onPressed: () {
                    product.toggleFavourite();
          }),
          trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItems(product.id, product.title, product.price);
              },
              color: Theme.of(context).accentColor),
        ),
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductDetailScreen.routeName,
                  arguments: product.id);
            },
            child: Container(child: Image.network(product.imageUrl, fit: BoxFit.cover))),
      ),
    );
  }
}
