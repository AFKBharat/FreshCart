import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            //title
            const Text(
              'FRESHCART',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 10),

            //subtitle
            Text(
              'Fresh Harvest, Delivered Daily',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),

            const SizedBox(height: 25),

            //button
            // MyButton(
            //   onTap: () => Navigator.pushNamed(context, '/login_page'),
            //   child: Icon(Icons.arrow_forward),
            // ),
          ],
        ),
      ),
    );
  }
}
