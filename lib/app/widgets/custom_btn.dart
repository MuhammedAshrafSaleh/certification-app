import 'package:certifications/app/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  final String text;
  void Function()? onPressed;
  CustomTextButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 56,
            child: TextButton(
              onPressed: onPressed,
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          // Set your desired border radius
                          borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(
                      AppTheme.primaryColor) // Set background color
                  ),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
