import 'package:flutter/material.dart';

import '../constants.dart';

class BottomClickableContainer extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const BottomClickableContainer({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 80,
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.only(bottom: 20),
        child: Center(
          child: Text(
            text,
            style: kLargeTextStyle,
          ),
        ),
      ),
    );
  }
}
