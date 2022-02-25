import 'package:flutter/material.dart';
import 'constants.dart';

class ButtonBottom extends StatelessWidget {
  ButtonBottom({@required this.onTap, @required this.title});
  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(title, style: lableTextStyle3),
        color: bottomContainerColour,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}