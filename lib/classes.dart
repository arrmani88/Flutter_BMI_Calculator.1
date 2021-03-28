import 'dart:math';
import 'package:bmi_calculator/homePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const textColor = Color(0xff8d8e98);
const smallTextStyle = TextStyle(fontSize: 18.0, color: textColor);
const bigTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);
const activeCardColor = Color(0xff1D1F33);
const inactiveCardColor = Color(0xff111328);
const redColor = Color(0xffeb1555);

void goToResultPage(BuildContext context) {
  Navigator.pushNamed(context, '/first');
}

void goToHomePage(BuildContext context) {
  Navigator.pop(context);
}

class RedCalculateButton extends StatelessWidget {
  final String text;
  final Function changePage;

  RedCalculateButton({this.text, this.changePage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changePage(context);
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: ThemeData
                  .dark()
                  .primaryColor,
            ),
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        height: 90.0,
        width: double.infinity,
        color: redColor,
      ),
    );
  }
}

class BmiCalculator {
  BmiCalculator({this.height, this.weight});

  final int weight;
  final int height;

  double _result;

  String getResult() {
    _result = weight / pow(height / 100, 2);
    return _result.toStringAsFixed(1);
  }

  String getDescription() {
    if (_result >= 25.0) {
      return 'Wawawawaw nare naree, ser ser 7ayd lia men hna rak ghled bezaf';
    } else if (_result > 18) {
      return 'A TBARKLAH 3LIK AWSTAD RAK FEL FORMA';
    } else {
      return 'NARE NARE 9RIB TMOUT AMSKHOT';
    }
  }

  String getSummary() {
    if (_result >= 25.0) {
      return 'OVERWEIGHT';
    } else if (_result > 18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }
}

class CardContent extends StatelessWidget {
  final IconData icon;
  final String text;

  CardContent({@required this.text, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0),
        SizedBox(height: 15.0),
        Text(text, style: smallTextStyle)
      ],
    );
  }
}


class ItemCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardContent;

  ItemCard({@required this.cardColor, @required this.cardContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardContent,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: cardColor,
      ),
    );
  }
}



class CircularButton extends StatelessWidget {

  CircularButton({this.icon, this.onPrs});

  final IconData icon;
  final Function onPrs;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPrs,
      elevation: 10.0,
      shape: CircleBorder(),
      fillColor: redColor,
      constraints: BoxConstraints(
        minHeight: 55.0,
        minWidth: 55.0,
      ),
      child: Icon(icon, color: Color(0xff0B0D22)),
    );
  }
}
