import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculo_imc/screens/results_page.dart';
import 'package:calculo_imc/components/icon_content.dart';
import 'package:calculo_imc/components/reusable_card.dart';
import 'package:calculo_imc/constants.dart';
import 'package:calculo_imc/components/bottom_button.dart';
import 'package:calculo_imc/components/round_icon_button.dart';
import 'package:calculo_imc/calculator_brain.dart';

enum Gender {masculino, feminino,}

class InputPage extends StatefulWidget{
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int altura = 180;
  int peso = 60;
  int idade = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CÁLCULO IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.masculino;
                    });
                  },
                  colour: selectedGender == Gender.masculino
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MASCULINO',
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.feminino;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.feminino
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMININO',
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ALTURA',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        altura.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                      activeTickMarkColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 13.0),
                      overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: altura.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          altura = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('KG', style: kLabelTextStyle,
                      ),
                      Text(peso.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed:(){
                              setState((){
                                peso--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                peso++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'IDADE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      idade.toString(),
                      style:kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                        setState(() {
                        idade--;
                        },);
                       },),
                        SizedBox(width:20.0,),
                        RoundIconButton(icon:FontAwesomeIcons.plus, onPressed:(){
                          setState(() {
                          idade++;
                          });
                        })
                      ],
                    )
                  ],
                ) ,
                ),
              ),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULAR',
            onTap: (){

              CalculadorBrain calc = CalculadorBrain(altura: altura, peso:peso);

              Navigator.push(
                  context,
                MaterialPageRoute(
                  builder: (context) =>ResultadoPage(
                   imcResult: calc.calcularIMC(),
                   resultText: calc.getResult(),
                   comentario: calc.getComentario(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}