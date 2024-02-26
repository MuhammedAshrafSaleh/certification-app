import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBtn extends StatelessWidget {
  CustomBtn(
      {super.key,
      required this.onPressed,
      required this.text1,
      required this.text2});
  void Function()? onPressed;
  String text1;
  String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(text2),
        ),
      ],
    );
  }
}
