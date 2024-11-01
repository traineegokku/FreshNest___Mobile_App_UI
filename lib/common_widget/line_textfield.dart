import 'package:FreshNest/common/color_extension.dart';
import 'package:flutter/material.dart';

class LineTextField extends StatelessWidget {
  //* ---------------------------------------------------------------------------------------
  final TextEditingController controller;
  final String title;
  final String placeholder;
  //? ------------------------------------------------------
  //? Written while modifying the Login screen.
  final TextInputType? keyboardType;
  final bool obscureText;
  //? ------------------------------------------------------
  final Widget? right;

  const LineTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.placeholder,
      this.right,
      this.keyboardType,
      this.obscureText = false});

  //* ---------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
              color: TColor.textTittle,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        TextField(
          controller: controller,
          //? ------------------------------------------------------
          //? Written while modifying the Login screen.
          keyboardType: keyboardType,
          obscureText: obscureText,
          //? ------------------------------------------------------
          decoration: InputDecoration(
            suffixIcon: right,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: placeholder,
            hintStyle: TextStyle(
              color: TColor.placeholder,
              fontSize: 17,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 1,
          color: const Color(0xffE2E2E2),
        )
      ],
    );
  }
}
