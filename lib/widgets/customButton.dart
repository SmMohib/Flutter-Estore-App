import 'package:flutter/material.dart';
import 'package:practice/const/color.dart';
import 'package:practice/widgets/customText.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
  
  });
  final String title;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: primaryColor,
      child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            onPressed();
          },
          child: Padding(
            padding: const EdgeInsets.only(
                left: 18, right: 18, top: 10, bottom: 10),
            child: Center(
              child: customText(
                 title, 16,whiteColor,FontWeight.w500),
            ),
          )),
    );
  }
}