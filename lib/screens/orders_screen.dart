import 'package:bbb_mart/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/Orders.dart';

class OrderCard extends StatefulWidget {
  final OrderItem orderItem;

  OrderCard(this.orderItem);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: Column(
        children: [
          SizedBox(
            height: 6,
          ),
          ListTile(
            leading: Chip(label: Text('\$${widget.orderItem.totalAmt}')),
            title: Text('Order Id: ${widget.orderItem.id}'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm')
                .format(widget.orderItem.dateTime)),
            trailing: (widget.orderItem.isPaid)
                ? const Icon(
                    Icons.check,
                    color: Colors.greenAccent,
                  )
                : Icon((_expanded) ? Icons.expand_less : Icons.expand_more),
          ),
          if (_expanded)
            Container(
              //width: widget.orderItem.cartItems.length*20+1000,
              padding: EdgeInsets.all(10),
              child: Column(
                children: widget.orderItem.cartItems
                    .map((e) => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  child: FittedBox(child: Text('\$${e.price}')),
                                ),
                                Text(e.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15)),
                                Text('x${e.quantity}')
                              ],
                            ),
                            Divider(),
                          ],
                        ))
                    .toList(),
              ),
            )
          else
            Divider(),
          SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  @override
  static const routeName = '/orders';

  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: (orders.getOrders.isNotEmpty)
          ? ListView.builder(
              itemBuilder: (ctx, i) => OrderCard(orders.getOrders[i]),
              itemCount: orders.getOrders.length)
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.add_shopping_cart),
                SizedBox(height: 5,),
                Text(
                  'Click the \'Checkout\' button in Cart to add Orders',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                )
              ],
            )),
    );
  }
}
