import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  void calculateBMI() {
    double feet = double.tryParse(feetController.text) ?? 0;
    double inch = double.tryParse(inchController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;

    double heightInMeter = (feet * 12 + inch) *
        0.0254; //Convert feet to inch and convert it to meter
    finalBMI = double.parse(
        (weight / (heightInMeter * heightInMeter)).toStringAsFixed(1));
    setState(() {});
  }

  late double finalBMI = 18.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 27, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          children: [
            TextFormField(
              controller: feetController,
              decoration: InputDecoration(
                  hintText: 'Height (Feet)',
                  hintStyle: TextStyle(fontSize: 22, color: Colors.grey)),
            ),
            TextFormField(
              controller: inchController,
              decoration: InputDecoration(
                  hintText: 'Height (Inch)',
                  hintStyle: TextStyle(fontSize: 22, color: Colors.grey)),
            ),
            TextFormField(
              controller: weightController,
              decoration: InputDecoration(
                  hintText: 'Weight (Kg)',
                  hintStyle: TextStyle(fontSize: 22, color: Colors.grey)),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue.shade300,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7)),
                onPressed: () => calculateBMI(),
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 23, color: Colors.white),
                )),
            SizedBox(height: 15,),
            SfRadialGauge(
                title: GaugeTitle(
                    text: 'BMI Meter',
                    textStyle: TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold)),
                axes: <RadialAxis>[
                  RadialAxis(minimum: 18.5, maximum: 40.0, ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 18.5,
                        endValue: 24.9,
                        color: Colors.green,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 25.0,
                        endValue: 29.9,
                        color: Colors.orange,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 30.0,
                        endValue: 34.9,
                        color: Colors.red,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 35.0,
                        endValue: 39.9,
                        color: Colors.blue,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 40.0,
                        endValue: 45.0,
                        color: Colors.deepOrange,
                        startWidth: 10,
                        endWidth: 10)
                  ], pointers: <GaugePointer>[
                    NeedlePointer(value: finalBMI )
                  ], annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Container(
                            child: Text('${finalBMI.toString()}',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold))),
                        angle: 90,
                        positionFactor: 0.6)
                  ])
                ]),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Underweight',style: TextStyle(fontSize: 24),),
                SizedBox(width: 20,),
                Text('Underweight',style: TextStyle(fontSize: 24),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Underweight',style: TextStyle(fontSize: 24),),
                SizedBox(width: 20,),
                Text('Underweight',style: TextStyle(fontSize: 24),),
              ],
            )

          ],
        ),
      ),
    );
  }
}
