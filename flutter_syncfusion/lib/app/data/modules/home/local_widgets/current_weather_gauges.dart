// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_syncfusion/app/data/model/weather_data_current.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CurrentWeatherGauge extends StatelessWidget {
  CurrentWeatherGauge({super.key, required this.weatherDataCurrent});
  final WeatherDataCurrent weatherDataCurrent;
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
        GaugeRange(startValue: 0, endValue: 28, color: Colors.green),
        GaugeRange(startValue: 28, endValue: 33, color: Colors.orange),
        GaugeRange(startValue: 33, endValue: 100, color: Colors.red)
      ], pointers: <GaugePointer>[
        NeedlePointer(value: weatherDataCurrent.current.temp!.toDouble())
      ], annotations: <GaugeAnnotation>[
        GaugeAnnotation(
            widget: Container(
                child: Text("${weatherDataCurrent.current.temp}°C",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
            angle: 90,
            positionFactor: 0.5)
      ])
    ]);
  }
}
