import 'package:flutter/material.dart';
import 'package:myshop/models/product.dart';
import 'package:myshop/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String ROUTE_NAME = "/productDetailsScreen";
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String productId = ModalRoute.of(context)!.settings.arguments as String;
    
    final product = Provider.of<Products>(context, listen: false).findById(productId);

    
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
