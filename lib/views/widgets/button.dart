// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:testapp/constants/color.dart';
import 'package:testapp/constants/texts.dart';

// All Attributes or Constants Here.

class CustomButton extends StatelessWidget {
  final Icon? icon;
  final String title;
  final Color? color;
  final double? borderRadius;

  const CustomButton(
      {super.key,
      this.icon,
      this.color,
      required this.title,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            backgroundColor: color ?? AppColors.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ?? const SizedBox(),
            const SizedBox(width: 10),
            NormalText(
                text: title, color: Colors.white, textSize: 16, bold: true),
          ],
        ));
  }
}


class ContactButtonWidget extends StatelessWidget {
  final Icon icon;

  const ContactButtonWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}

