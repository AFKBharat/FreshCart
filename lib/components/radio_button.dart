import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: const Text('Credit Card'),
            leading: Radio(
              value: 'Credit Card',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value as String;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Debit Card'),
            leading: Radio(
              value: 'Debit Card',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value as String;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('PayPal'),
            leading: Radio(
              value: 'PayPal',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value as String;
                });
              },
            ),
          ),
          // Add more payment methods as needed
          const SizedBox(height: 20),
          Text('Selected Payment Method: $selectedPaymentMethod'),
        ],
      ),
    );
  }
}
