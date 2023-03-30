import 'package:bbb_mart/screens/cart_screen.dart';
import 'package:bbb_mart/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Orders.dart';
import '../providers/cart.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final order = Provider.of<Orders>(context);
    // TODO: implement build
    return Drawer(
      width: (MediaQuery.of(context).size.width) * 0.75,
      //elevation: 2.3,
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Welcome to BBB Mart',
                softWrap: true,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            automaticallyImplyLeading: false, // removes back button
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            trailing: (cart.getItemCount > 0)
                ? CircleAvatar(
                    child: FittedBox(
                      child: Text('${cart.getItemCount}'),
                    ),
                    maxRadius: 14)
                : null,
            onTap: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.wallet),
            title: Text('Orders'),
            trailing: ( order.getUnpaidCount> 0)
                ? CircleAvatar(
                child: FittedBox(
                  child: Text('${order.getUnpaidCount}'),
                ),
                maxRadius: 14)
                : null,
            onTap: () {
              Navigator.of(context).pushNamed(OrdersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
