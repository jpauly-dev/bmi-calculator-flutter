import 'package:flutter/material.dart';

import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final void Function()? onPressed;

  const RoundIconButton(this.iconData, {super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 8,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: kRoundIconButtonFillColor,
      child: Icon(iconData),
    );
  }
}
