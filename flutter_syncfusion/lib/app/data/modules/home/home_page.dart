// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_syncfusion/app/data/modules/home/controller.dart';
import 'package:flutter_syncfusion/app/data/modules/home/local_widgets/current_weather_gauges.dart';
import 'package:flutter_syncfusion/app/data/modules/home/local_widgets/daily_weather_chart.dart';
import 'package:flutter_syncfusion/app/global_widgets/my_button.dart';
import 'package:flutter_syncfusion/app/data/modules/home/local_widgets/hourly_weather_chart.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomeController controller = Get.find<HomeController>();
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() => controller.loading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: AppBar(
                  title: const Text("Weather Charts"),
                ),
                body: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Daily button
                                  MyButton(
                                    text: "Daily",
                                    onTap: () {
                                      controller.currentIndex.value = 0;
                                    },
                                    selected:
                                        controller.currentIndex.value == 0,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  // Weekly button
                                  MyButton(
                                    text: "Hourly",
                                    onTap: () {
                                      controller.currentIndex.value = 1;
                                    },
                                    selected:
                                        controller.currentIndex.value == 1,
                                  )
                                ],
                              ),
                            ),
                            controller.currentIndex.value == 0
                                ? DailyWeatherChart(
                                    weatherDataDaily: controller
                                        .getWeatherData()
                                        .getDailyWeather())
                                : HourlyWeatherChart(
                                    weatherDataHourly: controller
                                        .getWeatherData()
                                        .getHourlyWeather(),
                                  )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: CurrentWeatherGauge(
                          weatherDataCurrent:
                              controller.getWeatherData().getCurrentWeather(),
                        ),
                      )
                    ],
                  ),
                ),
              )));
  }
}
