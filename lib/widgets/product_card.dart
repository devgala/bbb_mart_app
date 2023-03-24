import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String id;
  final String title;
  ProductCard({required this.imageUrl, required this.id, required this.title});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),

      child: GridTile(footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(title,textAlign: TextAlign.center),
        leading: IconButton(icon: Icon(Icons.favorite_outline_sharp),onPressed: (){}),
        trailing:  IconButton(icon: Icon(Icons.shopping_cart),onPressed: (){},color: Theme.of(context).accentColor),
      ),child: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, ProductDetailScreen.routeName,arguments: id);
          },
          child: Image.network(imageUrl,fit: BoxFit.cover )),
      ),
    );
  }
}
