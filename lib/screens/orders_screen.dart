import 'package:flutter/material.dart';
import 'package:myshop/widget/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:myshop/widget/order_item.dart';

import '../providers/orders.dart' show Order, OrderItem, Orders;


class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItemWidget(orderData.orders[i]),
      ),
    );
  }
}
