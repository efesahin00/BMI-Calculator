import 'package:flutter/material.dart';
import 'package:untitled8bmi/components/constants.dart';
import '../components/reusable_card.dart';
import 'package:untitled8bmi/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child:Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
          ),),
          Expanded(
              flex: 5,
              child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[Text(
                resultText.toUpperCase(),
                style: kResultTextStyle,
              ),
                Text(
                    bmiResult,
                style: kBMITextStyle,),
                Text(
                  interpretation,
                style: kBodyTextStyle,)

              ],
            ),
            onPress: () {},
    )
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
