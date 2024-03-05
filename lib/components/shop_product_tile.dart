import 'package:flutter/material.dart';
import 'package:freshcart/models/product.dart';
import 'package:freshcart/models/shop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({
    super.key,
    required this.product,
  });

  // add to cart button pressed
  void addToCart(BuildContext context) {
    // show a dialog box to confirm
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        content: const Text(
          "Add this item to your cart?",
        ),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          // yes button
          MaterialButton(
            onPressed: () {
              // pop dialog box
              Navigator.pop(context);

              // add to cart
              context.read<Shop>().addToCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),

      //height of the container
      height: 125,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product image on the left
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),

            // Adjust the width of the image container

            width: 100,

            // Adjust the height of the image container

            height: 100,
            padding: const EdgeInsets.all(8),
            child: Image.network(product.imagePath),
          ),

          const SizedBox(width: 10),

          // Product details in the middle

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Product name

                Text(
                  product.name,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),

                const SizedBox(height: 10),

                //Product Quantity
                Text(
                  product.quantity,
                  style:
                      GoogleFonts.montserrat(fontSize: 14, color: Colors.grey),
                ),

                // Product price

                Text(
                  "Price: ₹ ${product.price}",
                  style: GoogleFonts.montserrat(fontSize: 15),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Add to cart button on the right

          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            // Adjust the width of the button container

            width: 50,
            height: 50,
            // Adjust the height of the button container

            child: IconButton(
              onPressed: () => addToCart(context),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
