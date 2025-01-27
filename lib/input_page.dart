// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/bottom_card.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_card.dart';
import 'cards.dart';
import 'constants.dart';
import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender {
  male,
  female,
  none,
}

Gender? whichGender;

Color maleCardsColor = inactiveCardColor;
Color femaleCardsColor = inactiveCardColor;
int height = 180;
int weight = 60;
int age = 20;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'BMI CALCULATOR',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cards(
                    whenPressed: () {
                      setState(() {
                        whichGender = whichGender == Gender.male
                            ? Gender.none
                            : Gender.male;
                      });
                    },
                    colour: whichGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: GenderChild(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: Cards(
                    whenPressed: () {
                      setState(() {
                        whichGender = whichGender == Gender.female
                            ? Gender.none
                            : Gender.female;
                      });
                    },
                    colour: whichGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: GenderChild(
                      genderIcon: FontAwesomeIcons.venus,
                      genderText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Cards(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: myTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: mynumberStyle,
                      ),
                      Text(
                        'cm',
                        style: myTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: Color.fromARGB(255, 194, 24, 91),
                      overlayColor: Colors.pink.withOpacity(0.3),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                    ),
                    child: Slider(
                      min: 120,
                      max: 220,
                      divisions: 100,
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cards(
                      colour: activeCardColor,
                      cardChild: BottomCard(
                          tag1: 'weightMinus',
                          tag2: 'weightPlus',
                          displayText: weight.toString(),
                          bottomPressedMinus: () {
                            setState(() {
                              weight--;
                            });
                          },
                          title: 'WEIGHT',
                          bottomPressedPlus: () {
                            setState(() {
                              weight++;
                            });
                          })),
                ),
                Expanded(
                    child: Cards(
                  colour: activeCardColor,
                  cardChild: BottomCard(
                      tag1: 'ageMinus',
                      tag2: 'agePlus',
                      displayText: age.toString(),
                      bottomPressedPlus: () {
                        setState(() {
                          age++;
                        });
                      },
                      title: 'AGE',
                      bottomPressedMinus: () {
                        setState(() {
                          age--;
                        });
                      }),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color.fromARGB(255, 194, 24, 91),
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: mynumberStyle.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
