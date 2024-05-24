// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syncfusion/app/data/modules/home/controller.dart';
import 'package:flutter_syncfusion/app/data/modules/home/local_widgets/chart_widget.dart';
import 'package:flutter_syncfusion/app/data/modules/home/local_widgets/circle_chart.dart';
import 'package:flutter_syncfusion/app/data/modules/home/local_widgets/line_chart.dart';
import 'package:flutter_syncfusion/app/global_widgets/my_button.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomeController controller = Get.find<HomeController>();
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chart Example"),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              MyButton(
                                text: "Hourly",
                                onTap: () {
                                  controller.currentIndex.value = 1;
                                },
                                selected: controller.currentIndex.value == 1,
                              ),
                              MyButton(
                                text: "Daily",
                                onTap: () {
                                  controller.currentIndex.value = 0;
                                },
                                selected: controller.currentIndex.value == 0,
                              ),
                              MyButton(
                                text: "Weekly",
                                onTap: () {
                                  controller.currentIndex.value = 1;
                                },
                                selected: controller.currentIndex.value == 1,
                              ),
                              MyButton(
                                text: "Monthly",
                                onTap: () {
                                  controller.currentIndex.value = 1;
                                },
                                selected: controller.currentIndex.value == 1,
                              ),
                            ],
                          ),
                          Icon(Icons.filter_list_outlined)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ChartWidget(),
                  ],
                ),
              ),
              CircleChart(
                saving: 200,
                perSaving: 50,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
