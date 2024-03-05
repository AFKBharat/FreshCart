import 'package:flutter/material.dart';
import 'package:freshcart/components/login_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({super.key});

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  String selectedPaymentMethod = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Confirm Order",
          style: GoogleFonts.lexend(),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Shipping Address",
                  style: GoogleFonts.montserrat(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "User",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, "/address_page"),
                            child: const Text(
                              "Change",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Address City State Pincode",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Payment Method",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(
                          color: selectedPaymentMethod == 'Google Pay'
                              ? Colors
                                  .green // Change border color when selected
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        title:
                            Text('Google Pay', style: GoogleFonts.montserrat()),
                        leading: Radio(
                          value: 'Google Pay',
                          groupValue: selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedPaymentMethod = value as String;
                            });
                          },
                          activeColor:
                              Colors.green, // Change color when selected
                        ),
                        trailing: Image.asset(
                            "lib/images/google-pay.png"), // Add icon to the right
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(
                          color: selectedPaymentMethod == 'Paytm'
                              ? Colors
                                  .green // Change border color when selected
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        title: Text('Paytm', style: GoogleFonts.montserrat()),
                        leading: Radio(
                          value: 'Paytm',
                          groupValue: selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedPaymentMethod = value as String;
                            });
                          },
                          activeColor:
                              Colors.green, // Change color when selected
                        ),
                        trailing: Image.asset(
                          "lib/images/paytm.png",
                          width: 40,
                        ), // Add icon to the right
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(
                          color: selectedPaymentMethod == 'PayPal'
                              ? Colors
                                  .green // Change border color when selected
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        title: Text(
                          'PayPal',
                          style: GoogleFonts.montserrat(),
                        ),
                        leading: Radio(
                          value: 'PayPal',
                          groupValue: selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedPaymentMethod = value as String;
                            });
                          },

                          activeColor:
                              Colors.green, // Change color when selected
                        ),
                        trailing: Image.asset(
                          "lib/images/paypal.png",
                          width: 40,
                        ), // Add icon to the right
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 90),
                const MyButton(text: "Pay Now"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
