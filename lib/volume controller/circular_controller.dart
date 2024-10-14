import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGaugeWidget extends StatefulWidget {
  @override
  _RadialGaugeWidgetState createState() => _RadialGaugeWidgetState();
}

class _RadialGaugeWidgetState extends State<RadialGaugeWidget> {
// Variable to hold the current value of the pointer
  double _pointerValue = 75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radial Gauge Example'),
      ),
      body: Center(
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              // Define the range of values for the gauge
              minimum: 0,
              maximum: 100,
              ranges: <GaugeRange>[
                // Define the first range with a green color
                GaugeRange(
                  startValue: 0,
                  endValue: 50,
                  color: Colors.green,
                  startWidth: 10,
                  endWidth: 10,
                ),
                // Define the second range with an orange color
                GaugeRange(
                  startValue: 50,
                  endValue: 100,
                  color: Colors.orange,
                  startWidth: 10,
                  endWidth: 10,
                ),
              ],
              // Add a needle pointer to indicate the current value
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: _pointerValue,
                  enableAnimation: true,
                ),
              ],
              // Add an annotation to display the current value as text
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Text(
                    '${_pointerValue.toStringAsFixed(2)}%', // Display the percentage value with 2 decimal places
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  angle: 90,
                  positionFactor: 0.5,
                ),
              ],
              // Handle the tap event on the gauge to update the value
              onAxisTapped: (double value) {
                setState(() {
                  _pointerValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
