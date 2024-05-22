import 'package:flutter/material.dart';
import 'package:flutter_syncfusion/app/data/model/weather_data_daily.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class HourlyWeatherChart extends StatelessWidget {
  HourlyWeatherChart({super.key, required this.weatherDataDaily});
  // final WeatherDataHourly weatherDataHourly;
  final WeatherDataDaily weatherDataDaily;
  int temp_truncate(int temp) {
    return (temp / 10).truncate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: SfCartesianChart(
            primaryXAxis: const CategoryAxis(
              plotOffset: 10,
            ),
            title: ChartTitle(text: "Daily Weather"),
            legend: Legend(isVisible: true),
            series: <CartesianSeries<Daily, String>>[
              // Column serires
              ColumnSeries<Daily, String>(
                name: "Temperature",
                borderRadius: BorderRadius.all(Radius.circular(12)),
                width: 0.2,
                color: Color.fromARGB(255, 148, 163, 238),
                enableTooltip: true,
                dataSource: weatherDataDaily.daily,
                xValueMapper: (Daily daily, _) => DateFormat('MMMMd').format(
                    DateTime.fromMillisecondsSinceEpoch(daily.dt! * 1000)),
                yValueMapper: (Daily daily, _) => daily.temp?.day,
              ),
              // Spline series for minimum temperature
              SplineSeries<Daily, String>(
                color: Colors.amber,
                dataSource: weatherDataDaily.daily,
                xValueMapper: (Daily daily, _) => DateFormat('MMMMd').format(
                    DateTime.fromMillisecondsSinceEpoch(daily.dt! * 1000)),
                yValueMapper: (Daily daily, _) => daily.temp?.min,
                name: 'Min Temperature',
              ),
              // Spline series for maximum temperature
              SplineSeries<Daily, String>(
                color: Colors.blue,
                dataSource: weatherDataDaily.daily,
                xValueMapper: (Daily daily, _) => DateFormat('MMMMd').format(
                    DateTime.fromMillisecondsSinceEpoch(daily.dt! * 1000)),
                yValueMapper: (Daily daily, _) => daily.temp?.max,
                name: 'Max Temperature',
              )
            ],
            crosshairBehavior: CrosshairBehavior(
                enable: true,
                lineColor: Colors.red,
                activationMode: ActivationMode.singleTap),
          ),
        ),
      ),
    );
  }
}
