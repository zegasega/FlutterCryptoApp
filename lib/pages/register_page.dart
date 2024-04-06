import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stockprices/components/registerpage/register_textfield.dart';
import 'package:stockprices/components/registerpage/register_button.dart';
import 'package:http/http.dart' as http;
import 'package:stockprices/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final usernameController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  registerUser() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0), // grey[300] == 0xFFE0E0E0
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),

              //logo
              Image.asset(
                'lib/images/logo.png',
                height: 150,
                width: 150,
              ),

              //text
              Text(
                'Welcome! Join us now to get started.',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //name
              Register_Texfield(
                controller: usernameController,
                hinttext: 'Username',
                obscuretext: false,
              ),
              const SizedBox(
                height: 10,
              ),

              //email
              Register_Texfield(
                controller: mailController,
                hinttext: 'E-mail',
                obscuretext: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //password
              Register_Texfield(
                controller: passwordController,
                hinttext: 'Password',
                obscuretext: true,
              ),

              const SizedBox(
                height: 10,
              ),

              //password2
              Register_Texfield(
                controller: password2Controller,
                hinttext: 'Password',
                obscuretext: true,
              ),

              const SizedBox(
                height: 5,
              ),

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
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: const Text(
                        "login",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              RegisterButton(
                onTap: registerUser,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
