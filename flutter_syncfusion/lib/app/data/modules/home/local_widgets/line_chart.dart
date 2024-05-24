import 'package:flutter/material.dart';
import 'package:flutter_syncfusion/app/data/modules/home/local_widgets/chart_widget.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineCharts extends StatelessWidget {
  ChartData chartData;
  final data = [
    ChartData('2023-12-21', 14, 17, -4, 0),
    ChartData('2023-12-22', 22, 10, -2, 1),
    ChartData('2023-12-23', 32, 11, -1, 2),
    ChartData('2023-12-24', 14, 25, -1, 3),
    ChartData('2023-12-25', 15, 5, -1, 4),
    ChartData('2023-12-26', 19, 15, -1, 5),
    ChartData('2023-12-27', 28, 31, -1, 6),
    ChartData('2023-12-28', 22, 25, -1, 7),
    ChartData('2023-12-29', 42, 45, -1, 8),
    ChartData('2023-12-30', 12, 15, -1, 9),
    ChartData('2023-12-31', 12, 15, -1, 10),
    ChartData('2024-01-01', 11, 5, -2, 11),
    ChartData('2024-01-02', 12, 15, -1, 12),
    ChartData('2024-01-03', 15, 10, -3, 13),
    ChartData('2024-01-04', 30, 24, -5, 14),
    ChartData('2024-01-05', 6.4, 11, -9, 15),
    ChartData('2024-01-06', 14, 9, 0, 16),
    ChartData('2024-01-07', 12, 15, -2, 17),
    ChartData('2024-01-08', 15, 10, -4, 18),
    ChartData('2024-01-09', 3, 24, -3, 19),
    ChartData('2024-01-10', 6.4, 11, -6, 20),
    ChartData('2024-01-11', 19, 9, -8, 21),
    ChartData('2024-01-12', 14, 9, -8, 22),
    ChartData('2024-01-13', 3, 9, -8, 23),
    ChartData('2024-01-14', 24, 9, -9, 24),
  ];
  LineCharts({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        //trackball
        trackballBehavior: TrackballBehavior(
            enable: true,
            lineType: TrackballLineType.vertical,
            activationMode: ActivationMode.singleTap,
            shouldAlwaysShow: false,
            lineWidth: 1,
            lineColor: Colors.grey[300],
            tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
            tooltipAlignment: ChartAlignment.near,
            tooltipSettings: const InteractiveTooltip(
                color: Colors.green,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                format: '{point.label}'),
            hideDelay: 2000),
        enableSideBySideSeriesPlacement: false,
        plotAreaBorderWidth: 0,
        primaryXAxis: DateTimeAxis(
          majorGridLines: const MajorGridLines(width: 0),
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1, this.y2, this.i);

  final String x;
  final double y;
  final double y1;
  final double y2;
  final int i;

  DateTime get date {
    return DateTime.parse(x);
  }
}
