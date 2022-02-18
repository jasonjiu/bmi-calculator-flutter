import 'package:flutter/material.dart';

const lableTextStyle = TextStyle(fontSize: 18, color: Color(0xFF8D8E98));

class iconContent extends StatelessWidget {
  iconContent({this.text, this.fontAwesomeIcons});
  final IconData fontAwesomeIcons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(fontAwesomeIcons, size: 80),
        SizedBox(
          height: 15,
        ),
        Text(text, style: lableTextStyle)
      ],
    );
  }
}