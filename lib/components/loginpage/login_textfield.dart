import 'package:flutter/material.dart';

class Login_Texfield extends StatelessWidget {
  final controller;
  final String hinttext;
  final bool obscuretext;

  const Login_Texfield(
      {super.key,
      required this.controller,
      required this.hinttext,
      required this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        // => username
        controller: controller,
        obscureText: obscuretext,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            fillColor: const Color(0xFFEEEEEE),
            filled: true,
            hintText: hinttext,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
