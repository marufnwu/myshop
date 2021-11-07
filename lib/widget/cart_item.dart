import 'package:flutter/material.dart';
import 'package:myshop/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const CartItem(this.id, this.productId, this.price, this.quantity, this.title);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.id),
      background: Container(
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white, size: 40,),
        alignment: Alignment.centerRight,

      ),
      direction: DismissDirection.endToStart,
      onDismissed: (dir){
          Provider.of<Cart>(context, listen: false).removeItem(widget.productId);
      },
      confirmDismiss: (dir){
       return showDialog(
            context: context,
            builder: (ctx){
              return  AlertDialog(
                title: Text("Are you sure"),
                content: Text("Remove or not?"),
                actions: [
                  TextButton(
                      onPressed: (){
                        Navigator.of(ctx).pop(true);
                      },
                      child: Text("Yes")
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.of(ctx).pop(false);
                      },
                      child: Text("No")
                  )
                ],
              );
            }
        );
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
                  child: FittedBox(child: Text("\$${widget.price}"))),
            ),
            title: Text("Total \$${widget.price * widget.quantity}"),
            trailing: Text("Quantity ${widget.quantity} x"),
            subtitle: Text(widget.title),
          ),
        ),
      ),
    );
  }
}
