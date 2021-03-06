import 'package:flutter/material.dart';
import 'package:myshop/providers/product.dart';
import 'package:myshop/providers/cart.dart';
import 'package:myshop/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;


  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetailsScreen.ROUTE_NAME, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),

        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _){
              return IconButton(
                onPressed: () {
                  product.toggleFavourite();
                },
                icon:  Icon(product.isFavorite? Icons.favorite : Icons.favorite_border),
                color: Theme.of(context).accentColor,
              );
            }

          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(product.id, product.title, product.price);
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text("Cart Added"), duration: Duration(seconds: 2), backgroundColor: Colors.red,)
              );

            },
            icon: const Icon(
              Icons.add_shopping_cart,
            ),
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
