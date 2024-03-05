import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshcart/components/account_setting_tile.dart';
import 'package:freshcart/pages/auth_page.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final user = FirebaseAuth.instance.currentUser!;
  void signUserOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()),
    );
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {

        //   },
        //   icon: const Icon(Ionicons.chevron_back_outline),
        // ),
        // leadingWidth: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,

        title: Text(
          'Settings',
          style: GoogleFonts.lexend(),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),
                      child: const Icon(
                        Ionicons.person_circle_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User Name",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Email : ${user.email!}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Text(
                "Settings",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 25),
              AccountSettingsTile(
                color: Colors.green,
                icon: Ionicons.pencil_outline,
                title: "Edit Information",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              AccountSettingsTile(
                color: Colors.black,
                icon: Ionicons.moon_outline,
                title: "Theme",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              AccountSettingsTile(
                color: Colors.purple,
                icon: Ionicons.language_outline,
                title: "Language",
                onTap: () {},
              ),
              const SizedBox(
                height: 40,
              ),
              AccountSettingsTile(
                color: Colors.red,
                icon: Ionicons.log_out_outline,
                title: "Logout",
                onTap: signUserOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
