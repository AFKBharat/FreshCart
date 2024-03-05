import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;

  const SquareTile({Key? key, required this.imagePath, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(
            horizontal: 25), // Adjust the horizontal margin
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 30,
            ),
            const SizedBox(width: 10), // Adjust spacing between image and text
            Text(
              "Google",
              style: GoogleFonts.lexend(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
