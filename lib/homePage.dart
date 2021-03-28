import 'package:bmi_calculator/ResultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/classes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum Gender { male, female }

class _HomePageState extends State<HomePage> {
  Color maleColor = inactiveCardColor;
  Color femaleColor = inactiveCardColor;
  int userHeight = 183;
  int userWeight = 75;
  int userAge = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleColor == inactiveCardColor
                            ? maleColor = activeCardColor
                            : maleColor = inactiveCardColor;
                        femaleColor = inactiveCardColor;
                      });
                    },
                    child: ItemCard(
                      cardColor: maleColor,
                      cardContent: CardContent(
                        text: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        femaleColor == inactiveCardColor
                            ? femaleColor = activeCardColor
                            : femaleColor = inactiveCardColor;
                        maleColor = inactiveCardColor;
                      });
                    },
                    child: ItemCard(
                      cardColor: femaleColor,
                      cardContent: CardContent(
                        text: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ItemCard(
              cardColor: activeCardColor,
              cardContent: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('HEIGHT', style: smallTextStyle)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(userHeight.toString(), style: bigTextStyle),
                      Text('CM'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(),
                    child: Slider(
                        activeColor: redColor,
                        value: userHeight.toDouble(),
                        min: 50,
                        max: 230,
                        onChanged: (double value) {
                          setState(() {
                            userHeight = value.toInt();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ItemCard(
                    cardColor: activeCardColor,
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: smallTextStyle),
                        Text(userWeight.toString(), style: bigTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularButton(
                                icon: FontAwesomeIcons.plus,
                                onPrs: () {
                                  setState(() {
                                    if (userWeight < 200) userWeight++;
                                  });
                                }),
                            SizedBox(width: 15.0),
                            CircularButton(
                                icon: FontAwesomeIcons.minus,
                                onPrs: () {
                                  setState(() {
                                    if (userWeight > 0) userWeight--;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ItemCard(
                    cardColor: activeCardColor,
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: smallTextStyle),
                        Text(userAge.toString(), style: bigTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularButton(
                              icon: FontAwesomeIcons.plus,
                              onPrs: () {
                                setState(() {
                                  if (userAge < 150) userAge++;
                                });
                              },
                            ),
                            SizedBox(width: 15.0),
                            CircularButton(
                              icon: FontAwesomeIcons.minus,
                              onPrs: () {
                                setState(() {
                                  if (userAge > 0) userAge--;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          RedCalculateButton(
            text: 'CALCULATE',
            changePage: (ctx) {
              BmiCalculator res =
                  BmiCalculator(weight: userWeight, height: userHeight);
              Navigator.push(
                  ctx,
                  MaterialPageRoute(
                      builder: (ctx) => ResultPage(
                          res: res.getResult(),
                          summary: res.getSummary(),
                          description: res.getDescription())));
            },
          ),
        ],
      ),
    );
  }
}
