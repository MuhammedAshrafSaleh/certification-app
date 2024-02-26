import 'package:certifications/app/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.text,
    this.keyboardType,
    required this.hasIcon,
    this.onpressedIcon,
  });
  void Function()? onpressedIcon;
  bool hasIcon = false;
  var controller;
  var text;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: (widget.hasIcon && !showPassword),
      decoration: InputDecoration(
        suffixIcon: widget.hasIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        labelText: widget.text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            style: BorderStyle.none,
            color: AppTheme.grey,
          ), // Change border color here
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppTheme.simpleGrey,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppTheme.simpleGrey,
          ),
        ),
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        fillColor: AppTheme.grey,
        filled: true,
      ),
      validator: widget.validator,
    );
  }
}
