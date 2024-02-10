// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// All Native Imports Here.
import 'package:testapp/constants/color.dart';
import 'package:testapp/constants/texts.dart';
import 'package:testapp/views/widgets/button.dart';

// All Attributes or Constants Here.

class InfoBlocWidget extends StatelessWidget {
  final String title;
  final Widget content;

  const InfoBlocWidget({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: HeaderText(text: title, textSize: 18),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: content),
        ],
      ),
    );
  }
}

class InfoBlocContentWidget extends StatelessWidget {
  final String header;
  final bool? isHeaderEditable;
  final String description;
  final Icon? headerIcon;
  final Color? headerIconBgColor;
  final String buttonTitle;

  const InfoBlocContentWidget(
      {super.key,
      required this.header,
      this.isHeaderEditable,
      required this.description,
      this.headerIconBgColor,
      this.headerIcon,
      required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (headerIcon != null)
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: headerIconBgColor),
            child: headerIcon,
          ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              NormalText(text: header, textSize: 16),
              const SizedBox(width: 18),
              if (isHeaderEditable == true)
                const Icon(FontAwesomeIcons.pencil,
                    color: Colors.grey, size: 20)
            ],
          ),
        ),
        NormalText(
            text: description, textSize: 14, color: AppColors.lightTextColor),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: CustomButton(title: buttonTitle),
        ),
      ],
    );
  }
}
