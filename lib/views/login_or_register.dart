import 'package:expense_tracker_app/views/login_page.dart';
import 'package:expense_tracker_app/views/register_screen.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //Initially show login page at the beginning
  bool showLoginPage = true;

  //toggle between the login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      // if the showLoginPage is true
      return LoginPage(
        onTap: togglePages,
      ); //return loginPage
    } else {
      return RegisterPage(
        onTap: togglePages,
      ); //otherwise just show the RegisterPage
    }
  }
}
