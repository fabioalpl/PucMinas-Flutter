import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  //const Tela2({super.key});
  String mensagem;
  Tela2(this.mensagem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 2"),
      ),
      body: Text(mensagem),
    );
  }
}
