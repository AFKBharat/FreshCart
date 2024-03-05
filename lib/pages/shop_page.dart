import 'package:flutter/material.dart';

import 'package:freshcart/pages/body.dart';

import 'package:google_fonts/google_fonts.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({
    super.key,
  });

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'FRESHCART',
        style: GoogleFonts.lexend(),
      ),
      centerTitle: true,
      foregroundColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Colors.green,
      elevation: 0,
      leading: // go to account button
          IconButton(
        onPressed: () => Navigator.pushNamed(context, "/account_page"),
        icon: const Icon(
          Icons.menu_rounded,
          size: 30,
        ),
      ),
      actions: [
        // go to cart button
        IconButton(
          onPressed: () => Navigator.pushNamed(context, "/cart_page"),
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}
