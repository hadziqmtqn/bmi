import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi, this.bmiCalculator})
      : super(key: key);
  final double bmi;
  final BmiCalculator? bmiCalculator;

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    // final bmiCategory =
    bmiCalculator.determineBmiCatergory();
    // final bmiDesc =
    bmiCalculator.getHealRiskDescription();

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        title: const Text("Count Result BMI"),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            child: const Center(
              child: Text(
                "Result",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: BmiCard(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      // (bmiCalculator.bmiCategory == null) ? "" : bmiCalculator.bmiCategory
                      bmiCalculator.bmiCategory ?? "",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    Text(
                      bmiCalculator.bmiDescription ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
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
            height: 60,
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff517DF6), // warna button footer
            ),
            child: const Center(
                child: Text(
              "Recalculate BMI",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
        ),
      ]),
    );
  }
}
