import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart_model.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Your Cart",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: _CartItems(),
            ),
            Divider(),
            _Buy(),
          ],
        ),
      ),
    );
  }
}

class _Buy extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 45, //height of button
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("This feature is not supported yet"),
                  ),
                );
              },
              child: Text(
                "(\$${_cart.totalPrice})  Buy Now",
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItems extends StatefulWidget {
  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<_CartItems> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.products?.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: () {
            _cart.remove(_cart.products[index]);
            setState(() {});
          },
          icon: Icon(Icons.remove_circle),
        ),
        title: Text(_cart.products[index].name),
      ),
    );
  }
}
