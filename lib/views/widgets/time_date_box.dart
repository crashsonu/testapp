// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:testapp/constants/color.dart';
import 'package:testapp/constants/texts.dart';

// All Attributes or Constants Here.

class TimeDateBoxWidget extends StatelessWidget {
  final String date;
  final String weekDay;
  final bool? isSelected;

  const TimeDateBoxWidget(
      {super.key, required this.date, required this.weekDay, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: isSelected == true
              ? AppColors.primaryColor.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: isSelected == true
                  ? AppColors.primaryColor
                  : AppColors.borderLightColor)),
      child: Column(
        children: [
          NormalText(
            text: date,
            textSize: 14,
            color: isSelected == true
                ? AppColors.primaryColor
                : AppColors.lightTextColor,
          ),
          const SizedBox(height: 1),
          NormalText(
              text: weekDay,
              textSize: 13,
              color: isSelected == true
                  ? AppColors.primaryColor
                  : AppColors.lightTextColor)
        ],
      ),
    );
  }
}

class TimeDateRowWidget extends StatelessWidget {
  const TimeDateRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TimeDateBoxWidget(
            date: 'Overall',
            weekDay: 'summary',
          ),
          SizedBox(width: 10),
          TimeDateBoxWidget(
            date: '24 Jun',
            weekDay: 'sat',
            isSelected: true,
          ),
          SizedBox(width: 10),
          TimeDateBoxWidget(date: '25 Jun', weekDay: 'sun'),
          SizedBox(width: 10),
          TimeDateBoxWidget(date: '26 Jun', weekDay: 'mon'),
          SizedBox(width: 10),
          TimeDateBoxWidget(date: '27 Jun', weekDay: 'tue'),
          SizedBox(width: 10),
          TimeDateBoxWidget(date: '28 Jun', weekDay: 'wed'),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
