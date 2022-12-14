import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var imagemApp = "imagens/opcao.png";
  var mensagem = "";

  void opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["cara", "coroa"];
    var numero = Random().nextInt(2);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "cara":
        setState(() {
          imagemApp = "imagens/cara260.png";
        });
        break;
      case "coroa":
        setState(() {
          imagemApp = "imagens/coroa260.png";
        });
        break;
    }

    if (escolhaUsuario == escolhaApp) {
      setState(() {
        mensagem = "Parabéns você ganhou!!!";
      });
    } else {
      setState(() {
        mensagem = "Você perdeu :( ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cara ou Coroa"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do computador",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Image.asset(
            imagemApp,
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Sua Escolha",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Image.asset(
                  "imagens/cara260.png",
                  height: 100,
                ),
                onTap: () {
                  opcaoSelecionada("cara");
                },
              ),
              GestureDetector(
                child: Image.asset(
                  "imagens/coroa260.png",
                  height: 100,
                ),
                onTap: () {
                  opcaoSelecionada("coroa");
                },
              ),
            ],
          ),
          Text(
            mensagem,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
