import 'package:bbb_mart/DUMMY_DATA.dart';
import 'package:bbb_mart/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget{
  static const routeName = '/ProductDetailScreen';
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)?.settings.arguments as String;
    final product = Provider.of<ProductsProvider>(
        context,
      //listen: false, //is listen is set to false widget wont be rebuilt whenever data changes
                        // use for widgets where you dont have much change in data

    ).getItemById(productID);
  return Scaffold(

    appBar: AppBar(title: Text(product.title),backgroundColor: Theme.of(context).accentColor),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity, //(MediaQuery.of(context).size.width),
            height: (MediaQuery.of(context).size.height)*0.3,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Card(
              shape: Border.all(width: 1),
              elevation: 7,



                child: Image.network(product.imageUrl,fit: BoxFit.cover),

            ),
          ),
          SizedBox(height:15 ),
          Text("Price: \$${product.price}",style: TextStyle(fontSize: 30),),
          SizedBox(height:15 ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.description,
              softWrap: true,
              style: TextStyle(fontSize: 20),


            ),
          )
        ],
      ),
    ),

  );
  }
  
}