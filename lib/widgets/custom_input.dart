import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType? keyboardType;
  final bool? isPassword;

  const CustomInput({Key? key, required this.icon, required this.placeholder, required this.textController, this.keyboardType, this.isPassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(right: 20),
      decoration: boxDecoration(),
      child: TextField(
        controller: textController,
        autocorrect: false,
        keyboardType: keyboardType,
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: placeholder
        ),
      )
    );
  }

  boxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: const Offset(0,5),
        blurRadius: 5
      )
    ]
  );
}