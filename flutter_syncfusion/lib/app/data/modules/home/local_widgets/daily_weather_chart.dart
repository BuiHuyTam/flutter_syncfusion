// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_syncfusion/app/data/model/weather_data_daily.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class DailyWeatherChart extends StatelessWidget {
  DailyWeatherChart({super.key, required this.weatherDataDaily});
  final WeatherDataDaily weatherDataDaily;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(
        plotOffset: 10,
      ),
      legend: const Legend(isVisible: true),
      series: <CartesianSeries<Daily, String>>[
        // Column serires
        ColumnSeries<Daily, String>(
          name: "Temperature",
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          width: 0.2,
          color: const Color.fromARGB(255, 148, 163, 238),
          enableTooltip: true,
          dataSource: weatherDataDaily.daily,
          xValueMapper: (Daily daily, _) => DateFormat('MMMMd')
              .format(DateTime.fromMillisecondsSinceEpoch(daily.dt! * 1000)),
          yValueMapper: (Daily daily, _) => daily.temp?.day,
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
        // Spline series for minimum temperature
        SplineSeries<Daily, String>(
          color: Colors.amber,
          dataSource: weatherDataDaily.daily,
          xValueMapper: (Daily daily, _) => DateFormat('MMMMd')
              .format(DateTime.fromMillisecondsSinceEpoch(daily.dt! * 1000)),
          yValueMapper: (Daily daily, _) => daily.temp?.min,
          name: 'Min Temperature',
        ),
        // Spline series for maximum temperature
        SplineSeries<Daily, String>(
          color: Colors.blue,
          dataSource: weatherDataDaily.daily,
          xValueMapper: (Daily daily, _) => DateFormat('MMMMd')
              .format(DateTime.fromMillisecondsSinceEpoch(daily.dt! * 1000)),
          yValueMapper: (Daily daily, _) => daily.temp?.max,
          name: 'Max Temperature',
        )
      ],
      crosshairBehavior: CrosshairBehavior(
          enable: true,
          lineColor: Colors.red,
          activationMode: ActivationMode.singleTap),
    );
  }
}
