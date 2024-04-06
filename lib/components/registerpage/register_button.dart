import "package:flutter/material.dart";

class RegisterButton extends StatelessWidget {


  final Function()? onTap;
  const RegisterButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12)
          
          ),
      
        child: const Center(child: Text(
      
          "Sign In",
          style: TextStyle(color: Colors.white),
        ),
         
        ),
      ),
    );
  }
}