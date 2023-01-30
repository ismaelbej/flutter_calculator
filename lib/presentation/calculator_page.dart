import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/display.dart';
import 'widgets/keypad.dart';
import 'models/calculator_model.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});

  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ChangeNotifierProvider(
        create: (context) => CalculatorModel(),
        child: Consumer<CalculatorModel>(
          builder: (context, model, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Display(result: model.result),
                Expanded(
                  child: Keypad(
                    onPress: (button) => _onPress(context, button),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onPress(context, KeypadButtonData button) {
    switch (button) {
      case KeypadButtonData.k0:
      case KeypadButtonData.k1:
      case KeypadButtonData.k2:
      case KeypadButtonData.k3:
      case KeypadButtonData.k4:
      case KeypadButtonData.k5:
      case KeypadButtonData.k6:
      case KeypadButtonData.k7:
      case KeypadButtonData.k8:
      case KeypadButtonData.k9:
        Provider.of<CalculatorModel>(context, listen: false)
            .enterDigit(button.label);
        break;
      case KeypadButtonData.kDelete:
        Provider.of<CalculatorModel>(context, listen: false).delete();
        break;
      case KeypadButtonData.kReset:
        Provider.of<CalculatorModel>(context, listen: false).reset();
        break;
      case KeypadButtonData.kDot:
        Provider.of<CalculatorModel>(context, listen: false).enterDot();
        break;
      case KeypadButtonData.kSign:
        Provider.of<CalculatorModel>(context, listen: false).changeSign();
        break;
      case KeypadButtonData.kPlus:
        Provider.of<CalculatorModel>(context, listen: false)
            .pushOperation(Operation.add);
        break;
      case KeypadButtonData.kMinus:
        Provider.of<CalculatorModel>(context, listen: false)
            .pushOperation(Operation.sub);
        break;
      case KeypadButtonData.kProduct:
        Provider.of<CalculatorModel>(context, listen: false)
            .pushOperation(Operation.prod);
        break;
      case KeypadButtonData.kDivide:
        Provider.of<CalculatorModel>(context, listen: false)
            .pushOperation(Operation.div);
        break;
      case KeypadButtonData.kEqual:
        Provider.of<CalculatorModel>(context, listen: false)
            .pushOperation(Operation.equal);
        break;
      default:
        break;
    }
  }
}
