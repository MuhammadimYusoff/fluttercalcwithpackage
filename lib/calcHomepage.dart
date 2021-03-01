import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:scientificcalc/buttons.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //? Input and Output text display
  var input = '';
  var output = '';

  //? Buttons Text Display
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '.',
    '0',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          //? Top Side [Output/Answers]
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      input,
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      output,
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //? Bottom Side [Input/Operators & Numbers]
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  //? For 'Clear' Button
                  if (index == 0) {
                    return MyButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      btnText: buttons[index],
                      btnTap: () {
                        setState(() {
                          input = '';
                        });
                      },
                    );
                    //? 'Delete' button
                  } else if (index == 1) {
                    return MyButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      btnText: buttons[index],
                      btnTap: () {
                        setState(() {
                          input = input.substring(0, input.length - 1);
                        });
                      },
                    );
                    //? Equal Button
                  } else if (index == buttons.length - 1) {
                    return MyButton(
                      color: Colors.orange[800],
                      textColor: Colors.white,
                      btnText: buttons[index],
                      btnTap: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                    );
                  } else {
                    return MyButton(
                      btnText: buttons[index],
                      color: isOperator(
                        buttons[index],
                      )
                          ? Colors.deepPurple
                          : Colors.deepPurple[50],
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                      btnTap: () {
                        setState(() {
                          input += buttons[index];
                        });
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

//? Operator Functions
  bool isOperator(String opr) {
    if (opr == '%' ||
        opr == '/' ||
        opr == 'x' ||
        opr == '-' ||
        opr == '+' ||
        opr == '=') {
      return true;
    }
    return false;
  }

  //? We will use the 'parse' from math_expressions package
  void equalPressed() {
    String input = this.input;

    //? This will replace 'x' to '*' for multiplication
    input = input.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    //? Evaluate the output
    output = eval.toString();
  }
  // TODO: Make ANS Button Functional
}
