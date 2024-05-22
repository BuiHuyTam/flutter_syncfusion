import 'package:flutter/material.dart';
import 'package:flutter_syncfusion/app/data/model/weather_data_hourly.dart';
import 'package:flutter_syncfusion/core/utils/functions/format_temp.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class HourlyWeatherChart extends StatelessWidget {
  HourlyWeatherChart({super.key, required this.weatherDataHourly});
  final WeatherDataHourly weatherDataHourly;
  String date = DateFormat("yMMMMd").format(DateTime.now());

  int temp_truncate(int temp) {
    return (temp / 10).truncate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bar chart example"),
      ),
      body: Center(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(text: "Half yearly sales analysis"),
          legend: Legend(isVisible: true),
          series: <CartesianSeries<Hourly, String>>[
            // Column serires
            ColumnSeries<Hourly, String>(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              width: 0.2,
              color: Color.fromARGB(255, 148, 163, 238),
              enableTooltip: true,
              dataSource: weatherDataHourly.hourly,
              xValueMapper: (Hourly hourly, _) => date,
              yValueMapper: (Hourly hourly, _) =>
                  FormatTemp(temp: hourly.temp!).formatted(),
            ),
          ],
          crosshairBehavior: CrosshairBehavior(
              enable: true,
              lineColor: Colors.red,
              activationMode: ActivationMode.singleTap),
        ),
      ),
    );
  }
}
