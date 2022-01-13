import 'package:flutter/material.dart'; //importação da biblioteca Material para Design
import 'package:flutter/widgets.dart'; //importação para utilizar widget do flutter
import 'package:projeto_perguntas/resultado.dart';
import 'questionario.dart';

main() {
  runApp(new QuizApp());
}

class _QuizAppState extends State<QuizApp> {
  /* Classe para os estados do QuizApp, ela herda da classe State que é parametrizada */
  int _perguntaSelecionada =
      0; //Variável para identificar o indice da lista de perguntas
  var _pontuacaoTotal = 0; //Variavel para guardar a pontuação do usuário

  final _perguntas = const [
    //Map de perguntas, respostas e suas pontuações
    {
      'texto': 'Qual a forma correta de declarar um numero inteiro em C/C++?',
      'respostas': [
        //Lista de respostas
        {'texto': 'a) ' 'double numero = 4;', 'pontuacao': 0},
        {'texto': 'b) ''int pontoflutuante = 1;', 'pontuacao': 10},
        {'texto': 'c) ''float inteiro = 1;', 'pontuacao': 0},
        {'texto': 'd) ''numero int = 1;', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Uma caracteristica de uma função recursiva em C/C++ é:',
      'respostas': [
        {'texto': 'a) ''Gasta pouca memória', 'pontuacao': 0},
        {'texto': 'b) ''Chama a si própria uma vez', 'pontuacao': 0},
        {'texto': 'c) ''Faz chamadas a outras funções', 'pontuacao': 0},
        {'texto': 'd) ''Possui condição de parada', 'pontuacao': 10},
      ],
    },
    {
      'texto':
          'Qual a palavra reservada para se declarar uma estrutura em C++?',
      'respostas': [
        {'texto': 'a) ''structure', 'pontuacao': 0},
        {'texto': 'b) ''cout', 'pontuacao': 0},
        {'texto': 'c) ''struct', 'pontuacao': 10},
        {'texto': 'd) ''map', 'pontuacao': 0},
      ]
    },
    {
      'texto':
          'A biblioteca fstream possui alguns tipos para manipulação de dados. Como por exemplo o "ifstream", "ofstream", e "ifstream", responda respectivamente em ordem o que cada um faz.',
      'respostas': [
        {'texto': 'a) ''escrita, leitura e ambos', 'pontuacao': 0},
        {'texto': 'b) ''escrita, ambos e leitura', 'pontuacao': 0},
        {'texto': 'c) ''leitura, escrita e ambos', 'pontuacao': 10},
        {'texto': 'd) ''leitura, ambos e escrita', 'pontuacao': 0},
      ]
    },
    {
      'texto':
          'Qual o valor final da variável "b" no seguinte código em C/C++: \n int a = 0;\nint b = a;\na = b+1;\nb=++a',
      'respostas': [
        {'texto': 'a) ''1', 'pontuacao': 0},
        {'texto': 'b) ''0', 'pontuacao': 0},
        {'texto': 'c) ''2', 'pontuacao': 10},
        {'texto': 'd) ''3', 'pontuacao': 0},
      ]
    },
    {
      'texto':
          'Qual o valor final de "i" no seguinte código em C/C++: \n int i = 1;\ni = 1 + true;',
      'respostas': [
        {'texto': 'a) ''0', 'pontuacao': 0},
        {'texto': 'b) ''false', 'pontuacao': 0},
        {'texto': 'c) ''true', 'pontuacao': 0},
        {'texto': 'd) ''2', 'pontuacao': 10},
      ]
    },
  ];

  void _responder(int pontuacao) {
    /*Função responder: Verifica se existe uma pergunta selecionada,
   ou seja se o indice não está fora do limite, também muda o estado da aplicação, pelo método setState
  e incrementa o indice da lista de perguntas, e soma a pontuação do usuário*/
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    /*Função para realizar a reinicialização do app, 
  setando os estados para os estados iniciais */
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    /**Função utilizada apaenas para saber se o indice está dentro do limite */
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    /**Método Build é o redenrizador dessa classe que utiliza nossa arvore de widgets */
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Quiz'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntaSelecionada: _perguntaSelecionada,
                  perguntas: _perguntas,
                  responder: _responder)
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
