

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String Function(String?) validator;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.validator,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(),
            hintText: widget.hintText,
          ),
          
         validator: (value) {
  final validationMessage = widget.validator(value);
  setState(() {
    _validate = validationMessage != null && validationMessage.isNotEmpty;
  });
  return validationMessage ?? ''; // Return an empty string if null
},
        ),
      ),
    );
  }
}
