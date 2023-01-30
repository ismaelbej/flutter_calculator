import 'package:flutter/material.dart';

import 'keypad_button.dart';

enum KeypadButtonData {
  kReset("AC"),
  kDelete("C"),
  kPerc("%"),
  kDivide("÷"),
  k7("7"),
  k8("8"),
  k9("9"),
  kProduct("\u00d7"),
  k4("4"),
  k5("5"),
  k6("6"),
  kMinus("-"),
  k1("1"),
  k2("2"),
  k3("3"),
  kPlus("+"),
  k0("0"),
  kDot("."),
  kSign("±"),
  kEqual("=");

  final String label;

  const KeypadButtonData(this.label);
}

typedef KeypadButtonPress = void Function(KeypadButtonData value);

class Keypad extends StatelessWidget {
  final KeypadButtonPress onPress;

  const Keypad({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      children: KeypadButtonData.values
          .map(
            (buttonData) => KeypadButton(
              label: buttonData.label,
              action: () => onPress(buttonData),
            ),
          )
          .toList(),
    );
  }
}
