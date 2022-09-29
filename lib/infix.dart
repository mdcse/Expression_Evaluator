import 'package:calculator/components/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';
import 'constant.dart';
import 'components/my_button.dart';
import 'package:calculator/evaluator.dart';

class InFix extends StatefulWidget {
  const InFix({Key? key}) : super(key: key);

  @override
  State<InFix> createState() => _InFixState();
}

class _InFixState extends State<InFix> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushNamed(context, "/Root");
            }),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: TextStyle(fontSize: 30, color: whiteColor),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: whiteColor),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Mybutton(
                            title: 'AC',
                            onpress: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '+/-',
                            onpress: () {
                              userInput += '+/-';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '%',
                            onpress: () {
                              userInput += '%';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                              title: '/',
                              onpress: () {
                                userInput += '/';
                                setState(() {});
                              },
                              buttonClr: indigiAccent),
                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(
                            title: '7',
                            onpress: () {
                              userInput += '7';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '8',
                            onpress: () {
                              userInput += '8';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '9',
                            onpress: () {
                              userInput += '9';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                              title: 'x',
                              onpress: () {
                                userInput += 'x';
                                setState(() {});
                              },
                              buttonClr: indigiAccent),
                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(
                            title: '4',
                            onpress: () {
                              userInput += '4';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '5',
                            onpress: () {
                              userInput += '5';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '6',
                            onpress: () {
                              userInput += '6';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                              title: '-',
                              onpress: () {
                                userInput += '-';
                                setState(() {});
                              },
                              buttonClr: indigiAccent),
                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(
                            title: '1',
                            onpress: () {
                              userInput += '1';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '2',
                            onpress: () {
                              userInput += '2';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '3',
                            onpress: () {
                              userInput += '3';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                              title: '+',
                              onpress: () {
                                userInput += '+';
                                setState(() {});
                              },
                              buttonClr: indigiAccent),
                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(
                            title: '0',
                            onpress: () {
                              userInput += '0';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '.',
                            onpress: () {
                              userInput += '.';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: 'DEL',
                            onpress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            },
                          ),
                          Mybutton(
                              title: '=',
                              onpress: () {
                                Evaluate obj = new Evaluate();

                                // Exception `handling for '2+5-' like input
                                int i = userInput.length - 1;
                                // if (userInput[i])
                                equalpress();
                                setState(() {});
                                // print(ans);
                              },
                              buttonClr: indigiAccent),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void equalpress() {
    Parser p = Parser();
    String finalInput = userInput;
    finalInput = userInput.replaceAll('x', '*');
    Expression expression = p.parse(finalInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
