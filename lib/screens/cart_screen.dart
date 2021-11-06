import 'package:flutter/material.dart';
import 'package:myshop/providers/cart.dart';
import 'package:myshop/widget/cart_item.dart' as ci;
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const ROUTE_NAME = "/cartScreen";
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                Chip(
                  label: Text(
                    "\$ ${cart.totalAmount.toString()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Theme.of(context).accentColor,
                ),
                TextButton(
                    onPressed: () {},
                    child: Chip(
                      label: const Text(
                        "Order Now",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ))
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemBuilder: (ctx, index){
                  return ci.CartItem(
                    cart.items.values.toList()[index].id,
                    cart.items.keys.toList()[index],
                    cart.items.values.toList()[index].price,
                    cart.items.values.toList()[index].quantity,
                    cart.items.values.toList()[index].title,
                  );
                },
              itemCount: cart.items.length,
            )
        )
      ]),
    );
  }
}
