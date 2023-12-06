import 'package:flutter/material.dart';

import '../constants/shared_constants.dart';

class TextFieldWithIcon extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final IconData? sufixIcon;
  final bool isPassword;

  const TextFieldWithIcon({
    super.key,
    required this.hintText,
    required this.icon,
    this.sufixIcon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: AppColors.darkPurple,
          ),
          suffixIcon: Icon(
            sufixIcon,
            color: AppColors.gray3,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius:
                BorderRadius.circular(10.0), // Set the border radius here
          ),
          fillColor: const Color(0xFFF2F2F2)),
    );
  }
}
