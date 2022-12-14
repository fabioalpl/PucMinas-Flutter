import 'package:flutter/material.dart';

class MyWidget2 extends StatelessWidget {
  const MyWidget2({super.key});

  formataTexto() {
    return TextStyle(
        fontSize: 20,
        color: Colors.red,
        fontWeight: FontWeight.bold,
        letterSpacing: 10,
        wordSpacing: 20,
        decoration: TextDecoration.none);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App 2"),
        ),
        body: /*Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.blue),
            ),
            child: Text(
              'Texto 1',
              style: formataTexto(),
            ),
          ),
          Text(
            'Texto 2',
            style: formataTexto(),
          )
        ],
      ),*/
            Row(
          children: [
            Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              height: 200,
              width: 200,
            ),
            Image.asset(
              "imagens/owl.jpeg",
              height: 200,
              width: 200,
            )
          ],
        ));
  }
}
