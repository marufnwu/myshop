import 'package:flutter/material.dart';
import 'package:myshop/models/product.dart';
import 'package:myshop/providers/products.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  bool showOnlyFavorite;
   ProductGrid(this.showOnlyFavorite, { Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print(showOnlyFavorite);
   final productData =  Provider.of<Products>(context);
   final product = showOnlyFavorite? productData.favoriteItems: productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: product[index],
        child: ProductItem(
            // product[index].id,
            // product[index].title,
            // product[index].imageUrl
        ),
      ),
      itemCount: product.length,
    );
  }
}