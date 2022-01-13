import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  String texto;
  final void Function() onSelecao;

  Resposta(this.texto, this.onSelecao);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(texto),
        onPressed: onSelecao,
      ),
    );
  }
}
