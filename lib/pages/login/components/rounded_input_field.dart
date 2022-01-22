import 'package:flutter/material.dart';
import 'package:flutter_store_app/app_colors.dart';
import 'package:flutter_store_app/pages/login/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: const TextStyle(
            fontSize: 19, color: appPrimaryColor, fontWeight: FontWeight.bold),
        keyboardType: keyboardType,
        onChanged: onChanged,
        cursorColor: appPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: appPrimaryColor,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 19, color: appPrimaryColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
