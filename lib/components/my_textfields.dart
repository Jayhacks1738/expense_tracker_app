import 'package:flutter/material.dart';

//EMAIL/USERNAME TEXT FORM FIELD
class UsernameTextFormField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const UsernameTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  State<UsernameTextFormField> createState() => _UsernameTextFormFieldState();
}

class _UsernameTextFormFieldState extends State<UsernameTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    ));
  }
}

//PASSWORD TEXT FORM FIELD
class PasswordTextFormField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const PasswordTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  var _isObscure =
      true; //when user starts to type in this field the content will be obscure
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isObscure,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.grey[500]),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              child: _setPasswordIcon(),
            )),
      ),
    ));
  }

  Icon _setPasswordIcon() {
    if (_isObscure) {
      return const Icon(Icons.visibility);
    } else {
      return const Icon(Icons.visibility_off);
    }
  }
}

//CONFIRM PASSWORD TEXT FORM FIELD
class ConfirmTextFormField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const ConfirmTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  State<ConfirmTextFormField> createState() => _ConfirmTextFormFieldState();
}

class _ConfirmTextFormFieldState extends State<ConfirmTextFormField> {
  var _isObscure =
      true; //when user starts to type in this field the content will be obscure
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isObscure,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: 'Confirm Password',
            hintStyle: TextStyle(color: Colors.grey[500]),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              child: _setPasswordIcon(),
            )),
      ),
    ));
  }

  Icon _setPasswordIcon() {
    if (_isObscure) {
      return const Icon(Icons.visibility);
    } else {
      return const Icon(Icons.visibility_off);
    }
  }
}
