import 'package:bbb_mart/providers/products_provider.dart';
import 'package:bbb_mart/widgets/app_drawer.dart';
import 'package:bbb_mart/widgets/manager_prod_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManagerScreen extends StatelessWidget {
  static const routeName = '/ManagerScreen';

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: const Text('Listed Products'), actions: <Widget>[
        IconButton(onPressed: () {}, icon: const Icon(Icons.add))
      ]),
      body: ListView.builder(
          itemCount: productProvider.productList.length,
          itemBuilder: (_, i) => Column(
            children: [
              ManagerProductCard(
                  title: productProvider.productList[i].title,
                  imageUrl: productProvider.productList[i].imageUrl,
                  productId: productProvider.productList[i].id),
              const Divider(),
            ],
          )),
    );
  }
}
