import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconData, this.onPressed});
  final IconData iconData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
          width: 50,
          height: 50
      ),
      elevation: 6,
      shape: CircleBorder(),
      fillColor: greyColor,
      onPressed: onPressed,
      child: Icon(iconData),
    );
  }
}