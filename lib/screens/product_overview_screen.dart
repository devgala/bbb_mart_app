import 'package:bbb_mart/widgets/product_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../DUMMY_DATA.dart';
import '../widgets/product_card.dart';
class ProductOverviewScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //this file is a screen
    return Scaffold(
      appBar: AppBar(title:const Text("BBB Mart")),
      body: ProductGrid(),
    );


  }

}