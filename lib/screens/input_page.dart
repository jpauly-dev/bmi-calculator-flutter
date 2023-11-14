import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_clickable_container.dart';
import '../components/icon_content.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
import 'results_page.dart';

enum Gender {
  none,
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _gender = Gender.none;

  int _height = 180;
  int _weight = 60;

  int _age = 30;

  void updateGender(Gender newValue) {
    setState(() {
      _gender = newValue;
    });
  }

  void updateHeight(double newValue) {
    setState(() {
      _height = newValue.round();
    });
  }

  void decreaseWeight() {
    setState(() {
      _weight--;
    });
  }

  void increaseWeight() {
    setState(() {
      _weight++;
    });
  }

  void decreaseAge() {
    setState(() {
      _age--;
    });
  }

  void increaseAge() {
    setState(() {
      _age++;
    });
  }

  Color getGenderCardColor(Gender gender) {
    return _gender == gender ? kActiveCardColor : kInactiveCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                createGenderCard(
                  gender: Gender.male,
                  label: "MALE",
                  icon: FontAwesomeIcons.mars,
                ),
                createGenderCard(
                    gender: Gender.female,
                    label: "FEMALE",
                    icon: FontAwesomeIcons.venus),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: kSliderActiveColor,
                      inactiveTrackColor: kSliderInactiveColor,
                      thumbColor: kSliderThumbColor,
                    ),
                    child: Slider(
                      value: _height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: updateHeight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kTextStyle,
                        ),
                        Text(_weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(Icons.remove,
                                onPressed: decreaseWeight),
                            SizedBox(width: 12),
                            RoundIconButton(Icons.add,
                                onPressed: increaseWeight),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kTextStyle,
                        ),
                        Text(_age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(Icons.remove,
                                onPressed: decreaseAge),
                            SizedBox(width: 12),
                            RoundIconButton(Icons.add, onPressed: increaseAge),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomClickableContainer(
            text: "CALCULATE",
            onPressed: () {
              final calc = CalculatorBrain(height: _height, weight: _weight);
              calc.calculateBMI();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ResultsPage(
                    bmiResult: calc.getBmi(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Expanded createGenderCard(
      {required Gender gender, required String label, required IconData icon}) {
    return Expanded(
      child: ReusableCard(
        onTap: () {
          updateGender(gender);
        },
        color: getGenderCardColor(gender),
        child: IconContent(
          label: label,
          icon: icon,
        ),
      ),
    );
  }
}
