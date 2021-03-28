import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/classes.dart';

class ResultPage extends StatelessWidget {

  ResultPage({this.res, this.summary, this.description});

  final String summary;
  final String description;
  final String res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: ResultPageContent(res: res, summary: summary, description: description,),
    );
  }
}

class ResultPageContent extends StatelessWidget {

  ResultPageContent({@required this.res, @required this.summary, @required this.description});

  final String summary;
  final String description;
  final String res;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110.0,
          // width: 320.0,
          child: Center(
            child: Text(
              'Your result',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: ItemCard(
            cardColor: activeCardColor,
            cardContent: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    summary,
                    style: TextStyle(
                        color: Colors.greenAccent[400],
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    res.toString(),
                    style: TextStyle(
                      fontSize: 90.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        RedCalculateButton(
          text: 'RE-CALCULATE',
          changePage: goToHomePage,
        )
      ],
    );
  }
}
