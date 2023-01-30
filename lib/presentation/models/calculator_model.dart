import 'package:flutter/material.dart';

enum Operation {
  none,
  add,
  sub,
  prod,
  div,
  equal,
}

class CalculatorModel extends ChangeNotifier {
  String _input = "";
  String get result {
    if (_input.isNotEmpty) {
      return _input;
    }
    if (_memory != null) {
      return "$_memory";
    }
    return "";
  }

  double? _memory;
  Operation lastOperator = Operation.none;

  CalculatorModel();

  void enterDigit(String digit) {
    _setInput(_input + digit);
    notifyListeners();
  }

  void enterDot() {
    if (_input.isEmpty) {
      _setInput("0.");
    } else if (_input[_input.length - 1] == ".") {
      _setInput(_input.substring(0, _input.length - 1));
    } else if (!_input.contains(".")) {
      _setInput("$_input.");
    }
  }

  void changeSign() {
    if (_input.isNotEmpty) {
      if (_input.startsWith("-")) {
        _setInput(_input.substring(1));
      } else {
        _setInput("-$_input");
      }
    }
  }

  void reset() {
    lastOperator = Operation.none;
    _memory = null;
    _setInput("");
  }

  void delete() {
    _setInput(_input.substring(0, _input.length - 1));
  }

  void pushOperation(Operation operation) {
    if (_input.isNotEmpty) {
      double value = double.parse(_input);

      switch (lastOperator) {
        case Operation.add:
          _memory = _memory! + value;
          break;
        case Operation.sub:
          _memory = _memory! - value;
          break;
        case Operation.prod:
          _memory = _memory! * value;
          break;
        case Operation.div:
          _memory = _memory! / value;
          break;
        case Operation.none:
          _memory = value;
          break;
        case Operation.equal:
          _memory = value;
          break;
      }

      lastOperator = operation;
      _setInput("");
    } else {
      lastOperator = operation;
    }
  }

  void _setInput(newInput) {
    if (_input != newInput) {
      _input = newInput;
      notifyListeners();
    }
  }
}
