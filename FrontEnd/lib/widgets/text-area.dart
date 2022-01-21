import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';

class TextArea extends StatelessWidget {
  final String placeholder;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final Function onTap;
  final Function onChanged;
  final TextEditingController controller;
  final bool autofocus;
  final Color borderColor;
  final Color textColor;
  final bool obscureText;

  TextArea(
      {this.placeholder,
      this.suffixIcon,
      this.prefixIcon,
      this.onTap,
      this.onChanged,
      this.autofocus = false,
      this.borderColor = AllColors.border,
      this.textColor = AllColors.time,
      this.controller,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLines: 12,
        cursorColor: AllColors.muted,
        onTap: onTap,
        onChanged: onChanged,
        obscureText: obscureText,
        controller: controller,
        autofocus: autofocus,
        style: TextStyle(fontSize: 13.0, color: AllColors.time),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            filled: true,
            fillColor: AllColors.white,
            hintStyle: TextStyle(
              color: textColor,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            hintText: placeholder));
  }
}
