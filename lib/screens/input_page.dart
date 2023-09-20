
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled8bmi/calculator_brain.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';


enum Gender {
  male,
  female,
  other,
}


class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();

}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = Gender.other;
  int height = 180;
  int weight = 60;
  int age = 19;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars, label: 'MALE',),
                )),
                Expanded(child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus, label: "FEMALE",),
                ))
              ],
            )),


            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(
                  onPress: () {},
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                              height.toString(),
                          style: kNumberTextStyle,
                          ),
                          const Text(
                              'cm',
                          style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: const SliderThemeData(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x1fEB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:  RoundSliderOverlayShape(overlayRadius: 30.0),

                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,

                            inactiveColor: const Color(0xFF8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }


                        ),
                      )
                    ],
                  ),))
              ],
            )),


            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(
                  onPress: () {},
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           RoundIconButton(
                             icon: FontAwesomeIcons.minus,
                             onPressed: () {
                               setState(() {
                                 weight--;
                               });
                             }
                           ),
                           const SizedBox(
                             width: 10.0,
                           ),
                           RoundIconButton(
                             icon: FontAwesomeIcons.plus,
                             onPressed: () {
                               setState(() {
                                 weight++;
                               });
                             } ,
                           ),

                         ],
                       ),
                    ],
                  ),)),
                Expanded(child: ReusableCard(
                  onPress: () {},
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                          'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,

                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            } ,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            } ,
                          ),

                        ],
                      )
                      ],
                  ),))
              ],
            )),


            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap:  () {

                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                calc.getResult();


              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),

              )));
            },),
          ],
        )

    );
  }

}





class RoundIconButton extends StatelessWidget {

   const RoundIconButton({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressed();
      },
      elevation: 6,
      constraints:  const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape:const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),

        );
  }
}

