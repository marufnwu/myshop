import 'package:flutter/material.dart';
import 'package:myshop/models/product.dart';
import 'package:myshop/providers/cart.dart';
import 'package:myshop/providers/products.dart';
import 'package:myshop/widget/badge.dart';
import 'package:myshop/widget/product_grid.dart';
import 'package:provider/provider.dart';

enum FilterOption{
  Favorite,
  All
}

class ProductsOverviewScreen extends StatefulWidget {
   ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {

    final products = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyShop"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selected){
              setState(() {
                if(selected == FilterOption.Favorite){
                  //products.showFavoriteOnly();
                  _showOnlyFavorite = true;
                }else{
                  _showOnlyFavorite = false;
                  //products.showAll();
                }
              });
            },
              itemBuilder: (_){
                return [
                  const PopupMenuItem(child: Text("Only favorite"), value: FilterOption.Favorite,),
                  const PopupMenuItem(child: Text("Show All"), value: FilterOption.All,),

                ];
              },
            icon: const Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
              builder: (ctx, cart, ch){
                return Badge(
                  child: ch!,
                  value: cart.itemCount.toString() ,
                );
              },
            child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.shopping_cart),
            ),
          )

        ],
      ),
      body: ProductGrid(_showOnlyFavorite),
    );
  }
}


