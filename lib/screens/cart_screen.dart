import 'package:bbb_mart/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/Orders.dart';
import '../widgets/cart_item.dart'
    as ci; // to remove conflict bw 2 CartItem classes
//or do "./providers/cart.dart show Cart" as we only use Cart from that file
import '../providers/cart.dart';
import 'orders_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/CartScreen";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    var orders = Provider.of<Orders>(context);
    // TODO: implement build
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: const Text("My Cart")),
      body: Column(
        children: <Widget>[
          Card(
              margin: const EdgeInsets.all(15),
              elevation: 7,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Total:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                   const  SizedBox(
                      width: 10,
                    ),
                    Chip(
                        label: Text("\$${cart.getTotalAmount.toStringAsFixed(2)}"),
                        backgroundColor:const Color.fromRGBO(255, 242, 47, 0.3)),
                    const Spacer(),

                    ElevatedButton(
                        onPressed: () {
                          if(cart.getcart.values.isNotEmpty)
                          orders.addOrder(cart.getcart.values.toList(), cart.getTotalAmount);
                          Navigator.of(context).pushNamed(OrdersScreen.routeName);
                          cart.clear(); // put in the checkout page

                        }, child: const Text("CheckOut")),
                  ],
                ),
              )),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) =>  ci.CartItem(
              removeOne: cart.removeOne,
              prodId: cart.getcart.keys.toList()[i],
                title: cart.getcart.values.toList()[i].title,
                id: cart.getcart.values.toList()[i].id,
                price: cart.getcart.values.toList()[i].price,
                quantity: cart.getcart.values.toList()[i].quantity),
            itemCount: cart.getItemCount,
          )),
        ],
      ),
    );
  }
}
