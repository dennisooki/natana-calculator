import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

const kPrimaryColor = Color(0xFF4A4A58);
const kSecondaryColor = Color(0xFF282834);
const kAccentColor = Color(0xFFEAEB5E);

const kButtonTextStyle = TextStyle(fontSize: 28.0);

const kButtonPadding = EdgeInsets.all(16.0);

var kButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(16.0),
);

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _expression = '';
  String _result = '';

  void _append(String value) {
    setState(() {
      _expression += value;
    });
  }

  void _clear() {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  void _evaluate() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        _result = eval.toStringAsFixed(2); //rounds to 2 dec places
      });
    } catch (e) {
      setState(() {
        _result = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scientific Calculator"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    _result,
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _clear(),
                      child: Text(
                        'AC',
                        style: kButtonTextStyle,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _append('('),
                      child: Text(
                        '(',
                        style: kButtonTextStyle,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _append(')'),
                      child: Text(
                        ')',
                        style: kButtonTextStyle,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _append('/'),
                      child: Text('/', style: kButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _append('7'),
                      child: Text(
                        '7',
                        style: kButtonTextStyle,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    
                    ElevatedButton(
                      onPressed: () => _append('8'),
                      child: Text(
                        '8',
                        style: kButtonTextStyle,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _append('9'),
                      child: Text(
                        '9',
                        style: kButtonTextStyle,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _append('*'),
                      child: Text(
                        'X',
                        style: kButtonTextStyle,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                  ],
                ),
                // third row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _append('4'),
                      child: Text('4', style: kButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _append('5'),
                      child: Text('5', style: kButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _append('6'),
                      child: Text('6', style: kButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _append('-'),
                      child: Text('-', style: kButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                  ],
                ),
                // fourth row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _append('1'),
                      child: Text('4', style: kButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _append('2'),
                      child: Text('5', style: kButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _append('3'),
                      child: Text('6', style: kButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _append('+'),
                      child: Text('+', style: kButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                  ],
                ),
                // fifth row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _append('0'),
                      child: Text('0', style: kButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _append('.'),
                      child: Text('.', style: kButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _append('%'),
                      child: Text('%', style: kButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _evaluate(),
                      child: Text('=', style: kButtonTextStyle),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kAccentColor,
                        padding: kButtonPadding,
                        shape: kButtonShape,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


