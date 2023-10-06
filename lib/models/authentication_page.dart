import 'package:expense_tracker_app/views/home_screen.dart';
import 'package:expense_tracker_app/views/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  final Function()? onTap;
  const AuthenticationPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //checking if the user logged in
          if (snapshot.hasData) {
            return HomeScreen();
          }
          //User not logged
          else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
