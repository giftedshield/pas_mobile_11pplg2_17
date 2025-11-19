import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  final bool isNumber;
  final TextEditingController controller;
  final String label;
  final Color labelColor;
  final bool pass;
  const CustomTextfield({super.key, required this.controller, required this.label, required this.labelColor, required this.pass, required this.isNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:TextField(
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        inputFormatters: isNumber ?
        [FilteringTextInputFormatter.digitsOnly] : [],
        controller: controller,
        obscureText: pass,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: labelColor)
        ),
      )
    );
  }
}