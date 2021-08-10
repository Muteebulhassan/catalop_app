import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart_model.dart';
import 'package:flutter_app/models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item products;

  const AddToCart({Key key, this.products}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool buttonstate = _cart.products.contains(widget.products) ?? false;
    return IconButton(
      icon: Icon(buttonstate ? Icons.done : Icons.add),
      iconSize: 30.0,
      color: Colors.black,
      onPressed: () {
        if (!buttonstate) {
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(widget.products);
          setState(() {});
        }
        ;
      },
    );
  }
}
