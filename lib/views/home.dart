// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:testapp/constants/color.dart';
import 'package:testapp/constants/texts.dart';
import 'package:testapp/views/widgets/chart.dart';
import 'package:testapp/views/widgets/common_bloc.dart';
import 'package:testapp/views/widgets/user_info.dart';

// All Attributes or Constants Here.

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.appBgColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: AppBar(
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Icon(Icons.fitbit, color: Colors.white)),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    const HeaderText(text: 'ACTOFIT'),
                    Container(
                      height: 22,
                      width: 70,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Center(
                        child: NormalText(
                            text: 'DOCTOR',
                            textSize: 11,
                            color: Colors.white,
                            bold: true),
                      ),
                    )
                  ],
                ),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  child: Icon(Icons.search,
                      color: AppColors.lightTextColor, size: 30),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  child: Icon(Icons.notifications,
                      color: AppColors.lightTextColor, size: 30),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  child:
                      Icon(Icons.notes_outlined, color: Colors.black, size: 30),
                )
              ],
            ),
          ),
          body: const BodyWidget(),
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          UserInfoWidget(),
          InfoBlocWidget(
              title: 'Recent Alerts',
              content: InfoBlocContentWidget(
                  headerIcon: Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 18,
                  ),
                  headerIconBgColor: Colors.redAccent,
                  header: 'Red Alert',
                  description:
                      'Glucose spike above 130 mg/dL for 3 hour · 45m ago',
                  buttonTitle: 'Mark as Reviewed')),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(
              color: AppColors.borderLightColor,
            ),
          ),
          InfoBlocWidget(
              title: 'Active Diet and Workout Plan',
              content: Column(
                children: [
                  InfoBlocContentWidget(
                      isHeaderEditable: true,
                      header: 'Maharashtrian Veg Thali',
                      description:
                          'Coach Rudranshi · Monday 24 January, 11:45 am',
                      buttonTitle: 'View Diet'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(color: AppColors.borderLightColor),
                  ),
                  InfoBlocContentWidget(
                      isHeaderEditable: true,
                      header: 'Cardio and HIIT',
                      description: 'Coach Aman · Monday 23 January, 01:37 pm',
                      buttonTitle: 'View Workout'),
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(
              color: AppColors.borderLightColor,
            ),
          ),
          InfoBlocWidget(
              title: 'Assigned Prescription',
              content: Column(
                children: [
                  InfoBlocContentWidget(
                      header: 'Dolo 650',
                      description:
                          'Pill · 30 Days · Before Meal · 2 Dosage · Morning, Night · Tuesday 24 January, 02:43 pm',
                      buttonTitle: 'View / Edit'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(color: AppColors.borderLightColor),
                  ),
                  InfoBlocContentWidget(
                      header: 'Crocin Advance',
                      description:
                          'Pill · 24 Days · Before Meal · 1 Dosage · Morning · Tuesday 24 January, 02:43 pm',
                      buttonTitle: 'View / Edit'),
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(
              color: AppColors.borderLightColor,
            ),
          ),
          InfoBlocWidget(
              title: 'Recent Alerts',
              content: InfoBlocContentWidget(
                  headerIcon: Icon(
                    Icons.sticky_note_2_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                  headerIconBgColor: AppColors.primaryColor,
                  header: 'Actofit Report is ready',
                  description: '1 April - 14 April · PDF',
                  buttonTitle: 'Download')),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(
              color: AppColors.borderLightColor,
            ),
          ),
          ChartWidgetHeader(),
          ChartWidget(),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: ChartInfoWidget(),
          )
        ],
      ),
    );
  }
}



