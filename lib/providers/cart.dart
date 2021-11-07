import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
      required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
   Map<String, CartItem>? _items = {};

  Map<String, CartItem> get items {
    return {..._items!};
  }

  int get itemCount{
    return _items == null ? 0 : _items!.length;
  }

  double get totalAmount{
    double total = 0.0;
    _items!.forEach((key, value) {
        total += value.price*value.quantity;
    });

    return total;
  }

  void removeItem(String id){
    print(id);
    _items!.remove(id);
    notifyListeners();
  }

  void addItem(String id, String title, double price) {
    if (_items!=null && _items!.containsKey(id)) {
      _items!.update(id, (existingItem) => CartItem(id: existingItem.id, title: existingItem.title, quantity: existingItem.quantity+1, price: existingItem.price));
    } else {
      _items!.putIfAbsent(id, ()=>CartItem(id: DateTime.now().toString(), title: title, quantity: 1, price: price));
    }

    notifyListeners();
  }

  void clear(){
    _items = {};
    notifyListeners();
  }
}
