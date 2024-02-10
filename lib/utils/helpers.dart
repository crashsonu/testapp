// All Flutter Built-in Imports Here.
import 'dart:math';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:flutter/material.dart';

// All Attributes or Constants Here.

// Class to represent glucose data
class GlucoseData {
  GlucoseData(this.time, this.level, this.color, this.spikeLabel);

  final String time;
  final double level;
  final Color color;
  final String? spikeLabel;
}

// Function to generate full day glucose data
List<GlucoseData> generateFullDayGlucoseData() {
  List<GlucoseData> glucoseDataList = [];
  Random random = Random();

  // Base glucose level at the start
  double baseGlucoseLevel = 90.0;

  // Previous glucose level to track changes
  double previousGlucoseLevel = 90.0;

  // Loop through hours and minutes
  for (int hour = 0; hour < 24; hour += 3) {
    for (int minute = 0; minute < 60; minute += 10) {
      // Format time as per 12-hour clock
      String time =
          '${hour % 12 == 0 ? 12 : hour % 12}:${minute.toString().padLeft(2, '0')} ${hour < 12 ? 'am' : 'pm'}';

      double timeIncrement = hour + minute / 60.0;

      // Simulate gradual increase in the morning
      double morningIncrement =
          timeIncrement < 6.0 ? (timeIncrement / 6.0) * 20.0 : 0.0;

      // Simulate gradual decrease in the evening
      double eveningIncrement =
          timeIncrement > 18.0 ? ((24.0 - timeIncrement) / 6.0) * 20.0 : 0.0;

      // Simulate breakfast spike at 9 am
      double breakfastSpike = hour == 9 && minute == 0 ? 30.0 : 0.0;

      // Simulate lunch spike at 1 pm
      double lunchSpike = hour == 13 && minute == 0 ? 25.0 : 0.0;

      // Simulate dinner spike at 5 pm
      double dinnerSpike = hour == 17 && minute == 0 ? 35.0 : 0.0;

      // Simulate evening spike at 8 pm
      double eveningSpike = hour == 20 && minute == 0 ? 25.0 : 0.0;

      // Simulate night spike at 11 pm
      double nightSpike = hour == 23 && minute == 0 ? 20.0 : 0.0;

      // Calculate current glucose level based on various factors
      double glucoseLevel = baseGlucoseLevel +
          morningIncrement +
          eveningIncrement +
          breakfastSpike +
          lunchSpike +
          dinnerSpike +
          eveningSpike +
          nightSpike;

      // Ensure glucose levels don't go above 140 in the increased spike range
      if (glucoseLevel > 140) {
        glucoseLevel = 140;
      }

      // Add a spike of sugar from a base of 110 during meals
      if ((hour == 6 && minute == 0) ||
          (hour == 9 && minute == 0) ||
          (hour == 12 && minute == 0) ||
          (hour == 15 && minute == 0) ||
          (hour == 18 && minute == 0)) {
        double spikeValue = random.nextDouble() * 20.0;
        glucoseLevel += spikeValue;

        // Ensure the spike starts from 110 or above
        if (glucoseLevel < 110) {
          glucoseLevel = 110 + spikeValue;
        }

        // Check for sudden spike of 20 or more in the past 3 hours
        if ((glucoseLevel - previousGlucoseLevel).abs() >= 20) {
          // If there is a sudden spike of 20 or more, color the data point in red
          glucoseDataList.add(
            GlucoseData(time, glucoseLevel, Colors.red,
                '+ ${(glucoseLevel - 100).round()}'),
          );
        } else {
          // Otherwise, color the data point based on glucose level
          if (glucoseLevel >= 100) {
            glucoseDataList.add(
              GlucoseData(time, glucoseLevel, Colors.orangeAccent, null),
            );
          } else {
            glucoseDataList.add(
              GlucoseData(time, glucoseLevel, Colors.green, null),
            );
          }
        }
      } else {
        // Introduce minor fluctuations within the normal range (70-100)
        if (glucoseLevel >= 70 && glucoseLevel <= 95) {
          glucoseLevel += random.nextDouble() * 1.0 - 1.5;
        }

        // Color the data point based on glucose level
        if (glucoseLevel >= 100) {
          glucoseDataList.add(
            GlucoseData(time, glucoseLevel, Colors.orangeAccent, null),
          );
        } else {
          glucoseDataList.add(
            GlucoseData(time, glucoseLevel, Colors.green, null),
          );
        }
      }

      // Update the previous glucose level
      previousGlucoseLevel = glucoseLevel;
    }
  }

  return glucoseDataList;
}
