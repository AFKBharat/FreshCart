import 'package:flutter/material.dart';
import 'package:freshcart/models/shop.dart';
import 'package:freshcart/pages/account_page.dart';
import 'package:freshcart/pages/address_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freshcart/pages/cart_page.dart';
import 'package:freshcart/pages/confirm_page.dart';
import 'package:freshcart/pages/intro_page.dart';
import 'package:freshcart/pages/shop_page.dart';
import 'package:freshcart/pages/splash_screen.dart';
import 'package:freshcart/themes/light_mode.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
        '/account_page': (context) => const AccountPage(),
        '/address_page': (context) => const AddressPage(),
        '/confirm_page': (context) => const ConfirmPage(),
      },
    );
  }
}
