import 'package:flutter/material.dart';

enum Operation {
  none,
  add,
  sub,
  prod,
  div,
  perc,
  equal,
}

class CalculatorModel extends ChangeNotifier {
  String _input = "";
  String get result {
    if (_input.isNotEmpty) {
      return _input;
    }
    if (_result != null) {
      return "$_result";
    }
    return "";
  }

  double? _result;
  Operation lastOperator = Operation.none;

  CalculatorModel() : _result = 0.0;

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
    _result = null;
    _setInput("");
  }

  void delete() {
    if (_input.isNotEmpty) {
      _setInput(_input.substring(0, _input.length - 1));
    }
  }

  void pushOperation(Operation operation) {
    if (_input.isNotEmpty) {
      double value = double.parse(_input);

      switch (lastOperator) {
        case Operation.add:
          _result = _result! + value;
          break;
        case Operation.sub:
          _result = _result! - value;
          break;
        case Operation.prod:
          _result = _result! * value;
          break;
        case Operation.div:
          _result = _result! / value;
          break;
        case Operation.perc:
          _result = _result! * value / 100.0;
          break;
        case Operation.none:
          _result = value;
          break;
        case Operation.equal:
          _result = value;
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
