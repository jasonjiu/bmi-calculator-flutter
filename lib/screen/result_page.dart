import 'package:bmi_calculator/components/button_bottom.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              color: inactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(), style: resultTextStyle),
                  Text(bmiResult, style: bmiTextStyle),
                  Text(interpretation, style: bodyTextStyle, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          ButtonBottom(
            title: 'RE-CACULATE',
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
