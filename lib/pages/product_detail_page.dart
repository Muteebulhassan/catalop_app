import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/add_to_cart.dart';

class ProductDetailPage extends StatelessWidget {
  final Item products;

  const ProductDetailPage({Key key, @required this.products})
      : assert(products != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                height: 400,
                width: 400,
                child: Image.network(
                  products.image,
                ),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(80.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                products.name,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                products.desc,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.only(right: 30.0),
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                        // color: Colors.black,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Text(
                                        "\$${products.price}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    AddToCart(products: products),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
