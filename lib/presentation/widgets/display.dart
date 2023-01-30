import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String result;

  static const textStyle = TextStyle(
    fontFamily: 'Segment7',
    fontSize: 48,
  );
  const Display({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 72,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
