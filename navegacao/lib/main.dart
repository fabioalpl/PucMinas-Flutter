import 'package:flutter/material.dart';
import 'package:navegacao/tela2.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {"/TelaSecundaria": (context) => Tela2("Mensagem da tela")},
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.black12,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () {
            /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Tela2("Teste de mensagem")));
              */
            Navigator.pushNamed(context, "/TelaSecundaria");
          },
          child: Text("Próxima Tela"),
        ),
      ),
    );
  }
}
