import 'package:flutter/material.dart';

import 'Contato.dart';
import 'cardcontado.dart';

class ListaContatos extends StatelessWidget {
  //const ListaContatos({super.key});

  final List<Contato> contatos = [
    Contato(1, "Fábio de Almeida", "O mundo não é o bastante", "(27) 3488-4607",
        "foto"),
    Contato(2, "Fábio Oliveira", "Priorize e Simplifique", "(28) 2277-4480",
        "foto"),
    Contato(3, "oibaF ed adiemlA", "Disponível", "(68) 2073-6540", "foto"),
    Contato(4, "Guilherme de Sá", "Seja forte e corajoso", "(53) 3377-4672",
        "foto"),
    Contato(
        5,
        "Bond James Bond",
        "Um sorriso único , um olhar marcante, uma personalidade inesquecível.",
        "(85) 3742-3874",
        "foto"),
    Contato(
        6,
        "José Bezerra",
        "Ser luz não é sobre brilhar e sim sobre iluminar caminhos.",
        "(79) 2884-9776",
        "foto"),
    Contato(7, "Helena Cerqueira", "Ocupado", "(83) 2161-6298", "foto"),
    Contato(8, "Sophia Araújo", "Olá! Eu estou usando o WhatsApp.",
        "(95) 3767-1134", "foto"),
    Contato(9, "Monalisa Perrone", "Em tudo dai graças!!!", "(89) 2254-3186",
        "foto"),
    Contato(10, "Carlos Castro", "Being happy is my goal!  ♡", "(84) 3958-8415",
        "foto"),
    Contato(11, "Ricardo de Oliveira", "Felicidade é só questão de ser",
        "(67) 2950-6627", "foto"),
    Contato(12, "Fábiola Marques", "Gratidão", "(97) 3537-6660", "foto"),
    Contato(
        13, "Luciana Magalhães", "Too busy living", "(86) 3671-7268", "foto"),
    Contato(14, "Carla Perreira", "Respondo assim que puder", "(96) 3622-5178",
        "foto"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: contatos.map((contato) {
          return Container(
              width: double.infinity,
              padding: EdgeInsets.all(3),
              child: CardContato(contato: contato));
        }).toList(),
      ),
    );
  }
}
