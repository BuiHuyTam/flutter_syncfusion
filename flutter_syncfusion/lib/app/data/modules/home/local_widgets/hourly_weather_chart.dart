// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_syncfusion/app/data/model/weather_data_hourly.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class HourlyWeatherChart extends StatelessWidget {
  HourlyWeatherChart({super.key, required this.weatherDataHourly});
  final WeatherDataHourly weatherDataHourly;
  String getTime(final timeStamp) {
    DateTime time =
        DateTime.fromMicrosecondsSinceEpoch(timeStamp * 1000, isUtc: true);
    time = time.toLocal();
    String formattedTime = DateFormat('jm').format(time);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(
        plotOffset: 10,
      ),
      legend: const Legend(isVisible: true),
      series: <CartesianSeries<Hourly, String>>[
        // Column serires
        ColumnSeries<Hourly, String>(
          name: "Temperature",
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          width: 0.2,
          color: const Color.fromARGB(255, 148, 163, 238),
          enableTooltip: true,
          dataSource: weatherDataHourly.hourly,
          xValueMapper: (Hourly hourly, _) => getTime(hourly.dt),
          yValueMapper: (Hourly hourly, _) => hourly.temp,
        ),
        // Column serires
        ColumnSeries<Hourly, String>(
          name: "UV",
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          width: 0.2,
          color: Colors.red,
          enableTooltip: true,
          dataSource: weatherDataHourly.hourly,
          xValueMapper: (Hourly hourly, _) => getTime(hourly.dt),
          yValueMapper: (Hourly hourly, _) => hourly.uvi,
        ),
      ],
      crosshairBehavior: CrosshairBehavior(
          enable: true,
          lineColor: Colors.red,
          activationMode: ActivationMode.singleTap),
    );
  }
}
