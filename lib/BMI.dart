import 'package:flutter/material.dart';

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
        0.025; //Convert feet to inch and convert it to meter
    double BMI = (weight / (heightInMeter * heightInMeter));
  }

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

            SizedBox(height: 20,),
            Text('0',style:  TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
