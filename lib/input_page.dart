import 'package:bmi_calculator/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0XFF111249);
const inactiveCardColor = Color(0xFF1D1E33);
const bottomContainerColour = Color(0xFFEB1555);


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

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
        children: [
          Expanded(child: Row(
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
          )),
          Expanded(child: ReuseableCard(color: inactiveCardColor)),
          Expanded(child: Row(
            children: [
              Expanded(child: ReuseableCard(color: inactiveCardColor)),
              Expanded(child: ReuseableCard(color:inactiveCardColor)),
            ],
          )),
        ],
      )
    );
  }
}



