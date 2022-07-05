import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  // double calculateBmi() {
  //   double heightInMeter = height / 100;
  //   // final h = pow(height, 2);
  //   final h = (heightInMeter * heightInMeter);
  //   final bmi = weight / h;
  //   return bmi;
  // }

  List<Widget> generateList(start, end) {
    List<Widget> weights = [];
    for (var i = start; i < end; i++) {
      weights.add(Text(
        "$i",
        style: labelTextStyle!.copyWith(
          fontSize: 20,
        ),
      ));
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0E21),
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  gender = "male";
                  setState(() {});
                },
                child: BmiCard(
                  borderColor: (gender == "male") ? Colors.white : primaryColor,
                  child: const GenderIconText(
                    icon: Icons.male,
                    title: 'Male',
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  gender = "female";
                  setState(() {});
                },
                child: BmiCard(
                  borderColor:
                      (gender == "female") ? Colors.white : primaryColor,
                  child: const GenderIconText(
                    icon: Icons.female,
                    title: 'Female',
                  ),
                ),
              ),
            ),
          ],
        ),
        Center(
          child: BmiCard(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "HEIGHT",
                style: labelTextStyle!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$height",
                    style: numberTextStyle,
                  ),
                  Text(
                    "CM",
                    style: labelTextStyle,
                  )
                ],
              ),
              Slider(
                  value: height.toDouble(),
                  min: 80,
                  max: 200,
                  thumbColor: Colors.red,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    height = value.toInt();
                    setState(() {});
                  })
            ]),
          ),
        ),
        Container(
            child: Row(children: [
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "WEIGHT",
                  style: labelTextStyle,
                ),
                BmiCard(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: CupertinoPicker(
                              scrollController:
                                  FixedExtentScrollController(initialItem: 30),
                              itemExtent: 25,
                              magnification: 2,
                              useMagnifier: true,
                              onSelectedItemChanged: (val) {
                                weight = val + 20;
                              },
                              children: generateList(20, 220)),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "AGE",
                  style: labelTextStyle,
                ),
                BmiCard(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: CupertinoPicker(
                              scrollController:
                                  FixedExtentScrollController(initialItem: 5),
                              itemExtent: 25,
                              magnification: 2,
                              useMagnifier: true,
                              onSelectedItemChanged: (val) {
                                weight = val + 20;
                              },
                              children: generateList(15, 90)),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ])),
        GestureDetector(
          onTap: () {
            // print(calculateBmi());
            final bmiCalculator = BmiCalculator(height: height, weight: weight);
            bmiCalculator.calculateBmi();

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) {
                  return BmiResultScreen(
                    bmi: bmiCalculator.bmi!,
                  );
                }),
              ),
            );
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffEC3C66),
            ),
            child: const Center(
                child: Text(
              "Hitung BMI",
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

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff272A4E),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor!),
      ),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        )
      ],
    );
  }
}
