import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String tema = "Light";
  var themeData = ThemeData.light();

  @override
  void initState() {
    loadTheme();
    super.initState();
  }

  loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tema = prefs.getString("tema") ?? 'Light';
      themeData = tema == "Dark" ? ThemeData.dark() : ThemeData.light();
    });
  }

  setTheme(pr_tema) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tema = pr_tema;
      themeData = tema == "Dark" ? ThemeData.dark() : ThemeData.light();
      prefs.setString("tema", tema);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tema"),
        ),
        body: Column(children: [
          ElevatedButton(
              onPressed: () {
                setTheme("Light");
              },
              child: Text("Claro")),
          ElevatedButton(
              onPressed: () {
                setTheme("Dark");
              },
              child: Text("Escuro")),
        ]),
      ),
    );
  }
}
