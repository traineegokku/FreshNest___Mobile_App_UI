import 'package:FreshNest/common/color_extension.dart';
import 'package:flutter/material.dart';


//! ------------------------------------------------------------
class RoundButton extends StatelessWidget {
  //? -------------------------------------
  //? It's important to notice where these things are currently written.
  final String title;
  final VoidCallback onPressed;

  const RoundButton({super.key, required this.title, required this.onPressed});
  //? -------------------------------------

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      //* Important parameters of the "Get Started" button.
      onPressed: onPressed,
      height: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      minWidth: double.maxFinite,
      elevation: 0.1,
      color: TColor.primary,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
//! ------------------------------------------------------------


//! ------------------------------------------------------------
class RoundIconButton extends StatelessWidget {
  //? -------------------------------------
  //? It's important to notice where these things are currently written.
  final String title;
  final String icon;
  final Color bgColor;
  final VoidCallback onPressed;

  const RoundIconButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.bgColor,
      required this.onPressed});

  //? -------------------------------------
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      //! Important parameters of the "Get Started" button.
      onPressed: onPressed,
      height: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      minWidth: double.maxFinite,
      elevation: 0.1,
      color: bgColor,
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
//! ------------------------------------------------------------
