import 'package:flutter/material.dart';
import 'controller.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Home"),
            ),
            body: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: choices.map((device) {
                return Controller(device);
              }).toList(),
            )));
  }
}

class Choice {
  late String title;
  late IconData icon;
  late List<bool> power;
  Choice(String title, IconData icon) {
    this.title = title;
    this.icon = icon;
    this.power = [false];
  }
}

List<Choice> choices = <Choice>[
  Choice('Home', Icons.home),
  Choice('TV', Icons.tv),
  Choice('Computer', Icons.computer),
  Choice('AC', Icons.ac_unit),
  Choice('Camera', Icons.camera_alt),
  Choice('Phone', Icons.phone),
  Choice('Microwave Oven', Icons.microwave),
  Choice('WiFi', Icons.wifi),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline4;
    return Card(
        color: Colors.white,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(choice.icon,
                            size: 50.0, color: textStyle!.color))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(choice.title, style: textStyle)),
              ]),
        ));
  }
}
