import 'package:flutter/material.dart';
import 'package:calculo_imc/constants.dart';
import 'package:calculo_imc/components/reusable_card.dart';
import 'package:calculo_imc/components/bottom_button.dart';

class ResultadoPage extends StatelessWidget {

  ResultadoPage({@required this.imcResult, @required this.resultText, @required this.comentario});

  final String imcResult;
  final String resultText;
  final String comentario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA DE IMC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                  'RESULTADO',
                style: kTitleTextStyle,
               ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[Text(
                resultText,
                style: kResultadoTextStyle,
              ),
              Text(
               imcResult.toUpperCase(),
               style: kIMCTextStyle,
              ),
                Text(
                  comentario,
                  textAlign: TextAlign.center,
                  style:kCorpoTextStyle,
                ),
              ],
            ) ,
            ),
          ),
          BottomButton(
            buttonTitle: 'RECALCULAR',
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ) ,
    );
  }
}
