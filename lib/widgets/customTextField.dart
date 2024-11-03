import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      children: [
        const SizedBox(height: 20),
        TextFormField(
          controller: controller,
         cursorColor: primaryColor, // Cursor color set to primaryColor
          decoration: InputDecoration(
            hintText:  hintText,
            labelText: hintText,
            labelStyle: TextStyle(
              
             color: primaryColor, // Label text color set to primaryColor
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.black, // Border color
                width: 1.0, // Border width
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.black, // Enabled border color
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: primaryColor, // Focused border color set to primaryColor
                width: 2.0,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$hintText is missing!";
            }
            return null;
          },
          obscureText: isObscureText,
        ),
      ],
    );
  }
}
