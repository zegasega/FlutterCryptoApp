import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stockprices/components/registerpage/register_textfield.dart';
import 'package:stockprices/components/registerpage/register_button.dart';
import 'package:stockprices/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  final String url = 'http://192.168.0.18:3000/register';
//todo password != second password |password check |usarnamecheck
  void registerUser(BuildContext context) async {
    if (usernameController.text.isNotEmpty &&
        mailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        password2Controller.text.isNotEmpty &&
        passwordController.text == password2Controller.text) {
      var resBody = {
        "username": usernameController.text,
        "email": mailController.text,
        "password": passwordController.text
      };

      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(resBody),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        // Show dialog if registration is successful
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Registration successful!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 70),
                Image.asset(
                  'lib/images/logo.png',
                  height: 150,
                  width: 150,
                ),
                Text(
                  'Welcome! Join us now to get started.',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                Register_Texfield(
                  controller: usernameController,
                  hinttext: 'Username',
                  obscuretext: false,
                ),
                const SizedBox(height: 10),
                Register_Texfield(
                  controller: mailController,
                  hinttext: 'E-mail',
                  obscuretext: false,
                ),
                const SizedBox(height: 10),
                Register_Texfield(
                  controller: passwordController,
                  hinttext: 'Password',
                  obscuretext: true,
                ),
                const SizedBox(height: 10),
                Register_Texfield(
                  controller: password2Controller,
                  hinttext: 'Password',
                  obscuretext: true,
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Do you have an account?",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: const Text(
                          "login",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                RegisterButton(
                  onTap: () => registerUser(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
