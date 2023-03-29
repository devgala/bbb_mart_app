import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget{
  final String title;
  final String id;
  final String prodId;
  final int quantity;
  final double price;
  final Function removeOne;
  CartItem({required this.quantity,required this.price,required this.id,required this.title,required this.prodId,required this.removeOne});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Dismissible(
      //direction: DismissDirection.endToStart,
      onDismissed: (direction){
              if(direction==DismissDirection.endToStart){
                cart.removeItem(prodId);
              }else{

              }
      },
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Icon(Icons.delete),
            Text("Delete")
          ],
        ),

        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
      ),

      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
        child: Padding(padding: EdgeInsets.all(8.0),
          child: ListTile(
              title:Text(title,style: TextStyle(fontSize: 20)),
              leading: Chip(label: Text("\$${price}",style: TextStyle(fontSize: 13)),backgroundColor: Color.fromRGBO(0, 0, 204, 0.2)),
              trailing:  FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      removeOne(prodId);
                    }, icon: Icon(Icons.remove)),
                    CircleAvatar(child: FittedBox(child: Text("x${quantity}",style: TextStyle(fontSize: 15)))),


                  ],
                ),
              ),
            //subtitle: 
          ),

        ),
      ),
    );
  }


}