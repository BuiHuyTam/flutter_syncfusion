import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
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

    return SizedBox(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
          trackballBehavior: TrackballBehavior(
            enable: true,
            lineType: TrackballLineType.vertical,
            activationMode: ActivationMode.singleTap,
            shouldAlwaysShow: false,
            lineWidth: 1,
            lineDashArray: [10, 10],
            lineColor: Colors.black,
            tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
            tooltipAlignment: ChartAlignment.near,
            tooltipSettings: const InteractiveTooltip(
              color: Colors.black,
              textStyle: TextStyle(color: Colors.white, fontSize: 14),
            ),
            hideDelay: 3000, // Add this line
          ),
          enableSideBySideSeriesPlacement: false,
          plotAreaBorderWidth: 0,
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
            zoomMode: ZoomMode.x,
          ),
          primaryXAxis: DateTimeAxis(
              labelAlignment: LabelAlignment.center,
              majorGridLines: const MajorGridLines(width: 0),
              axisLine: const AxisLine(width: 0),
              majorTickLines: const MajorTickLines(size: 0),
              dateFormat: DateFormat('dd MMM'),
              interval: 3,
              initialVisibleMaximum: data[22].date,
              initialVisibleMinimum: data[12].date,
              plotBands: <PlotBand>[
                PlotBand(
                    isVisible: true,
                    start: data[20].date.add(const Duration(hours: 12)),
                    end: data[20].date.add(const Duration(hours: 12)),
                    borderWidth: 1,
                    borderColor: Colors.black,
                    dashArray: const [4, 5]),
              ],
              labelStyle: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodySmall!.fontFamily,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              )),
          primaryYAxis: NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              labelAlignment: LabelAlignment.center,
              minimum: -10,
              maximum: 50,
              interval: 10,
              majorGridLines: MajorGridLines(
                width: 3,
                color: Colors.blue.withOpacity(0.2),
              ),
              axisLine: const AxisLine(width: 0),
              majorTickLines: const MajorTickLines(size: 0),
              opposedPosition: true,
              axisLabelFormatter: (AxisLabelRenderDetails details) {
                if (details.text == '50') {
                  return ChartAxisLabel(
                      "USD",
                      TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.bodySmall!.fontFamily,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ));
                } else {
                  return ChartAxisLabel(
                      details.text,
                      TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.bodySmall!.fontFamily,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ));
                }
              }),
          // tooltipBehavior: tooltip,
          series: <CartesianSeries<ChartData, DateTime>>[
            ColumnSeries<ChartData, DateTime>(
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.date,
              yValueMapper: (ChartData data, _) => data.y,
              name: 'Cost',
              onCreateRenderer: (ChartSeries<ChartData, DateTime> series) {
                return _CustomColumnSeriesRenderer<ChartData, DateTime>();
              },
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              width: 0.25,
              markerSettings: const MarkerSettings(borderWidth: 0),
            ),
            ColumnSeries<ChartData, DateTime>(
              onCreateRenderer: (ChartSeries<ChartData, DateTime> series) {
                return _CustomColumnSeriesRenderer<ChartData, DateTime>();
              },
              dataSource: data.take(20).toList(),
              xValueMapper: (ChartData data, _) => data.date,
              yValueMapper: (ChartData data, _) => data.y2,
              name: 'Solar',
              color: Color.fromARGB(255, 122, 213, 165),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              width: 0.25,
              markerSettings: const MarkerSettings(borderWidth: 0),
            ),
            SplineSeries<ChartData, DateTime>(
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.date,
              yValueMapper: (ChartData data, _) => data.y1,
              name: 'Goal',
              color: Colors.lightBlue,
              width: 1.8,
              markerSettings: const MarkerSettings(borderWidth: 0),
            ),
            SplineSeries<ChartData, DateTime>(
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.date,
              yValueMapper: (ChartData data, _) => data.y1 - 5,
              name: 'Goal',
              color: Colors.amber,
              width: 1.8,
              markerSettings: const MarkerSettings(borderWidth: 0),
            ),
          ]),
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

class _ColsCustomPainter<ChartData, DateTime>
    extends ColumnSegment<ChartData, DateTime> {
  @override
  int get currentSegmentIndex => super.currentSegmentIndex;
  void onPaint(Canvas canvas) {
    final List<LinearGradient> gradientList = <LinearGradient>[
      const LinearGradient(
        colors: [Colors.purple, Colors.blueAccent],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        stops: [0.4, 0.7],
        tileMode: TileMode.decal,
      )
    ];
    fillPaint.shader =
        gradientList[currentSegmentIndex].createShader(segmentRect!.outerRect);
    super.onPaint(canvas);
  }
}

class _CustomColumnSeriesRenderer<ChartData, DateTime>
    extends ColumnSeriesRenderer<ChartData, DateTime> {
  _CustomColumnSeriesRenderer();
  @override
  ColumnSegment<ChartData, DateTime>() {
    return _ColsCustomPainter<ChartData, DateTime>();
  }
}
