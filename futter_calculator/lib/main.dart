import 'package:flutter/material.dart';
import 'package:futter_calculator/constant/color_constant.dart';
import 'package:futter_calculator/constant/string_constants.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        StringConstants.instance.equation = "0";
        StringConstants.instance.result = "0";
        StringConstants.instance.equationFontSize = 38.0;
        StringConstants.instance.resultFontSize = 48.0;
      } else if (buttonText == "DEL") {
        StringConstants.instance.equationFontSize = 38.0;
        StringConstants.instance.resultFontSize = 48.0;
        StringConstants.instance.equation = StringConstants.instance.equation.substring(0, StringConstants.instance.equation.length - 1);
        if (StringConstants.instance.equation == "") {
          StringConstants.instance.equation = "0";
        }
      } else if (buttonText == "=") {
        StringConstants.instance.equationFontSize = 38.0;
        StringConstants.instance.resultFontSize = 48.0;

        var expression = StringConstants.instance.equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          StringConstants.instance.result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          StringConstants.instance.result = "Error";
        }
      } else {
        StringConstants.instance.equationFontSize = 38.0;
        StringConstants.instance.resultFontSize = 48.0;
        if (StringConstants.instance.equation == "0") {
          StringConstants.instance.equation = buttonText;
        } else {
          StringConstants.instance.equation = StringConstants.instance.equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: ColorConstants.instance.iceCold,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: ColorConstants.instance.iceCold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.instance.cinnabar,
      appBar: AppBar(title: Text("Simple Calculator")),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              StringConstants.instance.equation,
              style: TextStyle(
                fontSize: StringConstants.instance.equationFontSize,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              StringConstants.instance.result,
              style: TextStyle(
                fontSize: StringConstants.instance.resultFontSize,
              ),
            ),
          ),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("C", 1, ColorConstants.instance.sweetCorn),
                      buildButton("DEL", 1, ColorConstants.instance.blue),
                      buildButton("+", 1, ColorConstants.instance.voodoo),
                    ]),
                    TableRow(children: [
                      buildButton("7", 1, ColorConstants.instance.amethystSmoke),
                      buildButton("8", 1, ColorConstants.instance.amethystSmoke),
                      buildButton("9", 1, ColorConstants.instance.amethystSmoke),
                    ]),
                    TableRow(children: [
                      buildButton("4", 1, ColorConstants.instance.amethystSmoke),
                      buildButton("5", 1, ColorConstants.instance.amethystSmoke),
                      buildButton("6", 1, ColorConstants.instance.amethystSmoke),
                    ]),
                    TableRow(children: [
                      buildButton("1", 1, ColorConstants.instance.amethystSmoke),
                      buildButton("2", 1, ColorConstants.instance.amethystSmoke),
                      buildButton("3", 1, ColorConstants.instance.amethystSmoke),
                    ]),
                    TableRow(children: [
                      buildButton(".", 1, ColorConstants.instance.amethystSmoke),
                      buildButton("0", 1, ColorConstants.instance.amethystSmoke),
                      buildButton("00", 1, ColorConstants.instance.amethystSmoke),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("×", 1, ColorConstants.instance.voodoo),
                    ]),
                    TableRow(children: [
                      buildButton("-", 1, ColorConstants.instance.voodoo),
                    ]),
                    TableRow(children: [
                      buildButton("+", 1, ColorConstants.instance.voodoo),
                    ]),
                    TableRow(children: [
                      buildButton("=", 2, ColorConstants.instance.voodoo),
                    ])
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
