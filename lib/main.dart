import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: kAppBackgroundColor,
        appBarTheme: AppBarTheme(
          color: kAppBackgroundColor,
        ),
      ),
      home: const InputPage(),
    );
  }
}
