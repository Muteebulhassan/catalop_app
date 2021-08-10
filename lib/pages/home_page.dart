import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/pages/product_detail_page.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_app/widgets/items_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.products =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Text(
            "ecommerce",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          ),
        ],
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 0.7,
            indent: 140,
            endIndent: 140,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Trending Items",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 25,
                letterSpacing: 0.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            //       child: Divider(
            //   color: Colors.black,
            //   height: 20,
            //   thickness: 0.7,
            //   indent: 67,
            //   endIndent: 67,
            // ),
          ),
          SizedBox(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: (CatalogModel.products != null &&
                      CatalogModel.products.isNotEmpty)
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(left: 10.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: CatalogModel.products.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                products: CatalogModel.products[index],
                              ),
                            ),
                          ),
                          child: ItemWidget(
                            products: CatalogModel.products[index],
                          ),
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
          Text(
            "All Items",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 30, letterSpacing: -1.0),
          ),
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 0.7,
            indent: 67,
            endIndent: 67,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(56.0),
              child: (CatalogModel.products != null &&
                      CatalogModel.products.isNotEmpty)
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: CatalogModel.products.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                products: CatalogModel.products[index],
                              ),
                            ),
                          ),
                          child: ItemWidget(
                            products: CatalogModel.products[index],
                          ),
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
    );
  }
}
