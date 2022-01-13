import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
   final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado{
    if (pontuacao < 30) {
      return "Sua nota foi baixa: $pontuacao pontos";
    } else if (pontuacao < 40) {
      return "Sua nota foi mediana: $pontuacao pontos";
    } else if (pontuacao < 50){
      return "Sua nota foi boa : $pontuacao pontos, Parabéns";
    } else
      return "Muito bomm, acertou todas, $pontuacao pontos";

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28, color: Colors.black87),
          ),
        ),
        ElevatedButton(
          onPressed: quandoReiniciarQuestionario, 
          child: Text("Responder Novamente"),
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 28)
            ),
            ),
      ],
    );
  }
}
