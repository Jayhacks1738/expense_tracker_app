import 'package:expense_tracker_app/components/my_button.dart';
import 'package:expense_tracker_app/components/my_textfields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  //Instantiation Global Key
  late Color myColor; //creating a universal color for the app
  late Size mediaSize; // the app according to screen size

  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  //sign in user method
  void signUserUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    //try creating the user
    try {
      //check if the password is confirmed
      if (passwordController.text == confirmController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          //creates user
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        //show error message, passwords do not match
        showErrorMessage('Passwords don\'t match!');
      }
      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      //show error message
      showErrorMessage(e.code);
    }
  }

  //wrong email message pop up
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: myColor,
            title: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage("lib/view/assets/images/gold.png"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ListView(
                children: [
                  //logo
                  const SizedBox(
                    height: 25,
                  ),
                  const Icon(
                    Icons.monetization_on_outlined,
                    size: 50,
                    color: Colors.black,
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  //welcome back, you've been missed
                  Text(
                    'Let\'s get started!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  //username textField
                  UsernameTextFormField(
                    controller: emailController,
                    hintText: 'email',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //password textField
                  PasswordTextFormField(
                    controller: passwordController,
                    hintText: 'password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ConfirmTextFormField(
                    controller: confirmController,
                    hintText: 'Confirm password',
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //forgot password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //sign in button
                  SignInButton(
                    text: 'Sign up',
                    onTap: signUserUp,
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  //or sign in with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[900],
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[900],
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //not a member? sign up now
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Login now',
                            style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
