// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_syncfusion/app/data/modules/home/controller.dart';
import 'package:flutter_syncfusion/app/global_widgets/hourly_weather_chart.dart';
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
                body: HourlyWeatherChart(
                    weatherDataHourly:
                        controller.getWeatherData().getHourlyWeather()),
              )));
  }
}
