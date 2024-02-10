// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// All Native Imports Here.
import 'package:testapp/constants/color.dart';
import 'package:testapp/constants/texts.dart';
import 'package:testapp/utils/helpers.dart';
import 'package:testapp/views/widgets/time_date_box.dart';

// All Attributes or Constants Here.

class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key});

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  List<GlucoseData> data = generateFullDayGlucoseData();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 400,
        width: 505,
        color: Colors.white,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            majorGridLines: const MajorGridLines(width: 0),
            minorGridLines: const MinorGridLines(width: 0),
          ),
          primaryYAxis: NumericAxis(
            minimum: 70,
            maximum: 160,
            interval: 10,
            majorGridLines: const MajorGridLines(width: 0),
            minorGridLines: const MinorGridLines(width: 0),
          ),
          tooltipBehavior: TooltipBehavior(enable: true, canShowMarker: false),
          series: <SplineSeries<GlucoseData, String>>[
            SplineSeries<GlucoseData, String>(
              dataSource: data,
              xValueMapper: (GlucoseData glucose, _) => glucose.time,
              yValueMapper: (GlucoseData glucose, _) => glucose.level,
              name: 'Glucose',
              pointColorMapper: (GlucoseData glucose, _) => glucose.color,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                textStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              dataLabelMapper: (GlucoseData glucose, _) {
                // Return null for points where you don't want to display labels
                return glucose.spikeLabel != null ? glucose.spikeLabel : '';
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChartWidgetHeader extends StatelessWidget {
  const ChartWidgetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalText(
            text: 'Rahul’s Healh Dasboard',
            textSize: 18,
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Row(
              children: [
                Icon(
                  Icons.radio_button_checked,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
                SizedBox(width: 10),
                HeaderText(
                  text: 'CGM',
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 30),
                Icon(
                  FontAwesomeIcons.bowlFood,
                  color: Colors.grey,
                  size: 20,
                ),
                SizedBox(width: 10),
                HeaderText(
                  text: 'Food Diary',
                  color: Colors.grey,
                  bold: true,
                  textSize: 15,
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                  width: 90,
                  child: Divider(
                    color: AppColors.primaryColor,
                    thickness: 2,
                  )),
              Expanded(child: Divider(color: AppColors.borderLightColor)),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: TimeDateRowWidget(),
          )
        ],
      ),
    );
  }
}

class ChartInfoWidget extends StatelessWidget {
  const ChartInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      color: Colors.white,
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NormalText(
                text: 'Average Glucose',
                color: AppColors.lightTextColor,
                textSize: 16,
              ),
              NormalText(
                text: '187.05 mg/dL',
                textSize: 16,
                bold: true,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NormalText(
                text: 'Time in range',
                color: AppColors.lightTextColor,
                textSize: 16,
              ),
              NormalText(
                text: '26.53',
                textSize: 16,
                bold: true,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NormalText(
                text: 'Time above range',
                color: AppColors.lightTextColor,
                textSize: 16,
              ),
              NormalText(
                text: '73.47%',
                textSize: 16,
                bold: true,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NormalText(
                text: 'Time below range',
                color: AppColors.lightTextColor,
                textSize: 16,
              ),
              NormalText(
                text: '0%',
                textSize: 16,
                bold: true,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
