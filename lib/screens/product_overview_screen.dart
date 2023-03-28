import 'package:bbb_mart/widgets/badge.dart';
import 'package:bbb_mart/widgets/product_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../DUMMY_DATA.dart';
import '../providers/cart.dart';
import '../widgets/product_card.dart';

enum FilterItems { Favourites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool showFavourites = false;
  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<Cart>(context);
    //this file is a screen
    return Scaffold(
      appBar: AppBar(
        title: const Text("BBB Mart"),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart,_2) {
              return Badge(
                  child: IconButton(
                      icon: Icon(Icons.shopping_cart), onPressed: () {}),
                  value: cart.getItemCount.toString(),
                  color: Theme.of(context).accentColor);
            },
          ),
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterItems.Favourites,
                child: Text("Show Favourites"),
              ),
              const PopupMenuItem(
                  value: FilterItems.All, child: Text("Show All"))
            ],
            onSelected: (FilterItems selected) {
              setState(() {
                if (selected == FilterItems.Favourites) {
                  showFavourites = true;
                } else {
                  showFavourites = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert_rounded, color: Colors.black87),
          )
        ],
      ),
      body: ProductGrid(showFavourites),
    );
  }
}
