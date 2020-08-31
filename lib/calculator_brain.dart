import 'dart:math';

class CalculadorBrain{

  CalculadorBrain({this.altura, this.peso});

  final int altura;
  final int peso;

  double _imc;

  String calcularIMC(){

    _imc = peso / pow(altura/100, 2);
    return _imc.toStringAsFixed(1);
  }

  String getResult(){
    if( _imc >= 25){
      return 'Excesso de Peso';
    }else if ( _imc > 18.5){
      return 'Normal';
    }else{
      return 'Abaixo do Peso';
    }

    }
String getComentario(){
  if( _imc >= 25){
    return 'Você tem um peso corporal maior do que o normal. Tente se exercitar mais.';
  }else if ( _imc > 18.5){
    return 'Você tem um peso corporal normal. Bom trabalho!';
  }else{
    return 'Você tem um peso corporal inferior ao normal. Você pode comer um pouco mais.';
  }
  }
}
