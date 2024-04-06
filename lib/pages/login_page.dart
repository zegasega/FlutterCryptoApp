import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stockprices/components/loginpage/login_loginbutton.dart';
import 'package:stockprices/components/loginpage/login_squaretile.dart';
import 'package:stockprices/components/loginpage/login_textfield.dart';
import 'package:stockprices/pages/register_page.dart';
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editiing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  
  signInUser(){}
  

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

                //welcome text
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 25,
                ),

                //username password textfield
                Login_Texfield(
                  controller: usernameController,
                  hinttext: 'Username',
                  obscuretext: false,
                ),

                const SizedBox(
                  height: 10,
                ),

                Login_Texfield(
                  controller: passwordController,
                  hinttext: 'Password',
                  obscuretext: true, 
                ),

                const SizedBox(height: 5,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.end ,
                    children: [
                      Text("Forgat Password?",
                      style: TextStyle(
                        color: Colors.grey[600],
                      
                      
                      ),),
                    ],
                  ),
                ),
                const SizedBox(height: 25,),

                LoginButton(onTap: signInUser(),),
                

                const SizedBox(height: 50,),

                // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'lib/images/google.png'),
                   SizedBox(width: 10,),
                  SquareTile(imagePath: 'lib/images/apple.png')
                  
                 

                ],
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a Member?"),
                    SizedBox(width: 4,),
                    Text("Register Now",
                    style: TextStyle(
                      color: Colors.blue,fontWeight: FontWeight.bold
                    ),
                    
                    )
                  ],
                ),
              )

                

              

              ],
            ),
          ),
        ));
  }
}
