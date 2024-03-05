import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshcart/components/address_textformfield.dart';
import 'package:freshcart/components/login_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String get currentUserId => FirebaseAuth.instance.currentUser?.uid ?? '';

  final NameController = TextEditingController();
  final MobileController = TextEditingController();
  final AddressController = TextEditingController();
  final CityController = TextEditingController();
  final StateController = TextEditingController();
  final ZipCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Shipping Address",
          style: GoogleFonts.lexend(),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/images/delivery.png",
                  width: 200,
                  height: 180,
                ),
                AddressTextFormField(
                  controller: NameController,
                  hintText: "Name",
                ),
                AddressTextFormField(
                  controller: MobileController,
                  hintText: "Mobile Number",
                ),
                AddressTextFormField(
                  controller: AddressController,
                  hintText: "Address",
                ),
                AddressTextFormField(
                  controller: CityController,
                  hintText: "City",
                ),
                AddressTextFormField(
                  controller: StateController,
                  hintText: "State",
                ),
                AddressTextFormField(
                  controller: ZipCodeController,
                  hintText: "Zip Code (Postal Code)",
                ),
                const SizedBox(height: 20),
                MyButton(text: "Save Address", onTap: saveAddressToFirestore),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveAddressToFirestore() {
    // Get the values from the controllers
    String name = NameController.text;
    String mobile = MobileController.text;
    String address = AddressController.text;
    String city = CityController.text;
    String state = StateController.text;
    String zipCode = ZipCodeController.text;

    // Add the data to Firestore
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId)
        .collection('Addresses')
        .add({
      'name': name,
      'mobile': mobile,
      'address': address,
      'city': city,
      'state': state,
      'zipCode': zipCode,
    });

    Navigator.pushNamed(context, '/confirm_page');

    // Optionally, you can add a success message or navigate to another screen
  }
}
