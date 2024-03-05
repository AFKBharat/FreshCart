import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressTextFormField extends StatelessWidget {
  final controller;
  final String hintText;
  const AddressTextFormField({
    super.key,
    this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          labelText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          labelStyle: GoogleFonts.montserrat(color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
