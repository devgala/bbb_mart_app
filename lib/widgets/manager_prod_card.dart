import 'package:flutter/material.dart';

class ManagerProductCard extends StatelessWidget
{
  final String title;
  final String imageUrl;
  final String productId;
  ManagerProductCard({required this.title,required this.imageUrl,required this.productId});
  @override
  Widget build(BuildContext context) {
   return ListTile(
     leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
     title: Text(title),
     trailing: Container(
       width:( MediaQuery.of(context).size.width)*0.3,
       child: Row(
         children: [
           IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Theme.of(context).primaryColor,)),
           IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Theme.of(context).errorColor,)),

         ],
       ),
     ),
   );
  }

}