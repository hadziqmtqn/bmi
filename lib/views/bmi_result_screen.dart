import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi}) : super(key: key);
  final double bmi;

  determineBmiCatergory(double bmiValue) {
    String category = "";
    if (bmiValue < 16.0) {
      category = underweightSevere;
    } else if (bmiValue < 17) {
      category = underweightModerate;
    } else if (bmiValue < 18.5) {
      category = underweightMild;
    } else if (bmiValue < 25) {
      category = normal;
    } else if (bmiValue < 30) {
      category = overweight;
    } else if (bmiValue < 35) {
      category = obeseI;
    } else if (bmiValue < 40) {
      category = obeseII;
    } else if (bmiValue >= 40) {
      category = obeseIII;
    }

    return category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      appBar: AppBar(
        title: Text("Hasil Hitung BMI"),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            child: Center(
              child: Text(
                "Hasil Perhitungan",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: BmiCard(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      determineBmiCatergory(bmi),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "${bmi.toStringAsFixed(1)}",
                      style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Your BMI result is quite low, you should eat more",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ]),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 80,
            color: Color(0xffEC3C66),
            child: Center(
                child: Text(
              "Hitung Ulang",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
        ),
      ]),
    );
  }
}
