import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stockprices/components/forgatpasswordpage/forgatpass_button.dart';
import 'package:stockprices/components/registerpage/register_textfield.dart';
import 'package:stockprices/components/registerpage/register_button.dart';
import 'package:http/http.dart' as http;
import 'package:stockprices/pages/login_page.dart';

class ForgatPasswordPage extends StatelessWidget {
  ForgatPasswordPage({super.key});

  final mailController = TextEditingController();

  forgatPassword() async {}

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
                'Enter your registered mail adress into the system',
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
                controller: mailController,
                hinttext: 'E-mail',
                obscuretext: false,
              ),
              const SizedBox(
                height: 10,
              ),

              ForgatButton(
                onTap: forgatPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
