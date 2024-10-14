import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CanvasController extends StatefulWidget {
  const CanvasController({super.key});

  @override
  State<CanvasController> createState() => _CanvasControllerState();
}

class _CanvasControllerState extends State<CanvasController> {
  @override
  Widget build(BuildContext context) {
    double progressValue = 50;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.3,
              width: screenWidth * 0.3,
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    startAngle: 270,
                    endAngle: 270,
                    axisLineStyle: const AxisLineStyle(
                      thickness: 1,
                      color: Color(0xff13162d),
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                          value: progressValue,
                          width: 0.1,
                          sizeUnit: GaugeSizeUnit.factor,
                          cornerStyle: CornerStyle.startCurve,
                          gradient: const SweepGradient(colors: <Color>[
                            Color(0xff1b1e4b),
                            Color(0xff64678d)
                          ], stops: <double>[
                            0.25,
                            0.75
                          ])),
                      MarkerPointer(
                        value: progressValue,
                        markerType: MarkerType.circle,
                        color: Colors.white,
                        enableAnimation: true,
                      ),
                    ],
                    annotations: [
                      GaugeAnnotation(
                          positionFactor: 0.1,
                          angle: 90,
                          widget: Text(
                            '${progressValue.toStringAsFixed(0)} / 100',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                          ))
                    ],
                    onAxisTapped: (double value){
                      setState(() {
                        progressValue=value;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
