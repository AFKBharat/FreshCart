import 'package:flutter/material.dart';
import 'package:freshcart/components/header_with_searchBox.dart';
import 'package:freshcart/components/shop_product_tile.dart';
import 'package:freshcart/models/shop.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().shop;
    //provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          SizedBox(
            height: 600, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: products.length,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
