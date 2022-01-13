import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(children: <Widget>[
      Questao(perguntas[perguntaSelecionada].cast()['texto'].toString()),
      ...respostas.map((resp) {
        return Resposta(resp['texto'].toString(),
            () => responder(int.parse(resp['pontuacao'].toString())));
      }).toList(),
    ]);
  }
}
