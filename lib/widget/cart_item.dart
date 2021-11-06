import 'package:flutter/material.dart';
import 'package:myshop/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const CartItem(this.id, this.productId, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white, size: 40,),
        alignment: Alignment.centerRight,

      ),
      direction: DismissDirection.endToStart,
      onDismissed: (dir){
          Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        color: Colors.white70,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(child: Text("\$${price}"))),
            ),
            title: Text("Total \$${price * quantity}"),
            trailing: Text("Quantity ${quantity} x"),
            subtitle: Text(title),
          ),
        ),
      ),
    );
  }
}
