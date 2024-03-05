import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshcart/pages/auth_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => const AuthPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'FRESHCART',
              style: GoogleFonts.lexend(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 50),
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
