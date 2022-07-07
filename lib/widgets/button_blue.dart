import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  const ButtonBlue({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.onPressed
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          primary: Colors.blue,
          shape: const StadiumBorder(),
        ),
        onPressed: onPressed,
        child: const Text('Ingresar', style: TextStyle(fontSize: 16))
      ),
    );
  }
}