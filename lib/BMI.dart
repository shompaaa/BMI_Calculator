import 'package:flutter/material.dart';
class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator',style: TextStyle(fontSize: 25, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade300,
      ),
    );
  }
}
