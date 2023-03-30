import 'package:bbb_mart/providers/Orders.dart';
import 'package:bbb_mart/providers/cart.dart';
import 'package:bbb_mart/providers/products_provider.dart';
import 'package:bbb_mart/screens/cart_screen.dart';
import 'package:bbb_mart/screens/orders_screen.dart';
import 'package:bbb_mart/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductsProvider()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.lightGreen,
            accentColor: Colors.yellowAccent,
            fontFamily: 'Lato'),
        home: ProductOverviewScreen(),
        routes: {
          ProductOverviewScreen.routeName : (ctx)=>ProductOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx)=>OrdersScreen(),
        },
      ),
    );
  }
}
