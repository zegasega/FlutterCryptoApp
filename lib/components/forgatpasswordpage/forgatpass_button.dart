import "package:flutter/material.dart";

class ForgatButton extends StatelessWidget {


  final Function()? onTap;
  const ForgatButton({super.key,required this.onTap});

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
      
          "Reset Password",
          style: TextStyle(color: Colors.white),
        ),
         
        ),
      ),
    );
  }
}