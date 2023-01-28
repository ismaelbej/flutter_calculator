import 'package:flutter/material.dart';

import 'widgets/display.dart';
import 'widgets/keypad.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Display(result: "0"),
            Expanded(child: Keypad()),
          ],
        ),
      ),
    );
  }
}
