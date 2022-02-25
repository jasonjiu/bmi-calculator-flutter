import 'package:bmi_calculator/screen/result_page.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../calculate_core.dart';
import '../components/button_bottom.dart';
import '../components/constants.dart';
import '../components/icon_content.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  int height = 180;
  int weight = 60;
  int age = 20;

  void updateColor(int gender){
    if (gender == 1){
      if(maleCardColor == inactiveCardColor){
        maleCardColor = activeCardColour;
        femaleCardColor = inactiveCardColor;
      }else{
        maleCardColor = inactiveCardColor;
      }
    }else if(gender == 2){
      if(femaleCardColor == inactiveCardColor){
        femaleCardColor = activeCardColour;
        maleCardColor = inactiveCardColor;
      }else{
        femaleCardColor = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(1);
                        });
                      },
                      child: ReuseableCard(
                          color: maleCardColor,
                          cardChild: iconContent(text: 'MALE', fontAwesomeIcons: FontAwesomeIcons.mars),
                      ),
                    )
                ),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: ReuseableCard(
                          color: femaleCardColor,
                          cardChild: iconContent(text: 'FEMALE', fontAwesomeIcons: FontAwesomeIcons.venus),
                      ),
                    )
                ),
              ],
            )
          ),
          Expanded(
              child: ReuseableCard(
                color: inactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: lableTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: lableTextStyle2),
                        Text('cm', style: lableTextStyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: Color(0x15EB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
          ),
          Expanded(
                child: Row(
                children: [
                  Expanded(
                    child: ReuseableCard(
                        color: inactiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: lableTextStyle),
                            Text(weight.toString(), style: lableTextStyle2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(iconData: FontAwesomeIcons.minus, onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                }),
                                SizedBox(width: 10),
                                RoundIconButton(iconData: FontAwesomeIcons.plus, onPressed:(){
                                  setState(() {
                                    weight++;
                                  });
                                }),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                  Expanded(
                    child: ReuseableCard(
                      color:inactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: lableTextStyle),
                          Text(age.toString(), style: lableTextStyle2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(iconData: FontAwesomeIcons.minus, onPressed: (){
                                setState(() {
                                  age--;
                                });
                              }),
                              SizedBox(width: 10),
                              RoundIconButton(iconData: FontAwesomeIcons.plus, onPressed:(){
                                setState(() {
                                  age++;
                                });
                              }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            )
          ),
          ButtonBottom(
            onTap: (){
              CalculatorCore calc =  CalculatorCore(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
            },
            title: 'CALCULATE'
          ),
        ],
      )
    );
  }
}










