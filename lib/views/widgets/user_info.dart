// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// All Native Imports Here.

import 'package:testapp/constants/color.dart';
import 'package:testapp/constants/texts.dart';
import 'package:testapp/views/widgets/button.dart';

// All Attributes or Constants Here.

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 70),
      child: Center(
          child: Column(
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('images/rahul.jpg'),
                fit: BoxFit.cover, // Adjust the fit based on your requirements
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, bottom: 5),
            child: NormalText(text: 'Rahul Sethi', textSize: 24),
          ),
          const NormalText(
              text: 'Weight Loss · 34 Year · Male · Diabetic',
              color: AppColors.lightTextColor),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    title: 'Prescribe',
                    borderRadius: 35,
                    color: AppColors.primaryColor,
                    icon: Icon(FontAwesomeIcons.notesMedical)),
                ContactButtonWidget(
                    icon: Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.white,
                )),
                ContactButtonWidget(
                    icon: Icon(FontAwesomeIcons.phoneVolume,
                        color: Colors.white, size: 17)),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Divider(color: AppColors.borderLightColor),
        ],
      )),
    );
  }
}
