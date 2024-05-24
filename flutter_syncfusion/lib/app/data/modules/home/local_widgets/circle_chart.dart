import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CircleChart extends StatelessWidget {
  const CircleChart({this.saving, this.perSaving, super.key});

  final double? saving;
  final double? perSaving;

  @override
  Widget build(BuildContext context) {
    const double maximum = 100;
    final value = perSaving ?? 0;
    return SizedBox(
        width: double.infinity,
        height: 300,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            // interval: 1,
            maximum: maximum,
            showLabels: false,
            showTicks: false,
            startAngle: 270,
            endAngle: 270,
            radiusFactor: 0.72,
            axisLineStyle: const AxisLineStyle(
              thickness: 0.15,
              color: Colors.grey,
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: value > maximum ? maximum : value,
                width: 0.2,
                pointerOffset: -0.05,
                color: Colors.greenAccent,
                sizeUnit: GaugeSizeUnit.factor,
              ),
              if (value > maximum)
                RangePointer(
                  value: value - maximum,
                  width: 0.18,
                  color: Colors.amber,
                  sizeUnit: GaugeSizeUnit.factor,
                ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Saving",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: const Color.fromARGB(255, 44, 238, 144),
                              fontWeight: FontWeight.bold,
                            )),
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        '\$',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.greenAccent,
                                  // fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(saving != null ? saving.toString() : "0",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.bold,
                              )),
                    ]),
                  ],
                ),
                positionFactor: 0.1,
                angle: 90,
              ),
            ],
          ),
        ]));
  }
}
