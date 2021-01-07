import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {Key key,
      this.decoration,
      this.maxLength,
      this.controller,
      this.validator,
      this.label,
      this.keyboardType,
      this.onChanged,
      this.onTap,
      this.obscureText = false,
      this.readOnly = false})
      : super(key: key);
  final TextEditingController controller;
  final Function validator;
  final Function onChanged;
  final String label;
  final TextInputType keyboardType;
  final Function onTap;
  final bool readOnly;
  final bool obscureText;
  final int maxLength;
  final InputDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: decoration,
      maxLength: maxLength,
      readOnly: readOnly,
      onTap: onTap,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType != null ? keyboardType : TextInputType.text,
      controller: controller,
      validator: validator,
      style: TextStyle(color: Colors.black),
    );
  }
}
