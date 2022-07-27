import 'package:eval_ex/expression.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String userInput = '';
  String answer = '';

  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 100,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      userInput,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      answer,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                itemCount: buttons.length,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    getNumberView(buttons[index], () {
                  if (buttons[index] == "=") {
                    evaluateExpression();
                  }
                  else if (buttons[index] == "C") {
                    userInput = '';
                    answer = '';
                    setState(() {});
                  }
                  else if (buttons[index] == "DEL") {
                   userInput= userInput.substring(0,userInput.length-1);
                    setState(() {});
                  }

                  else {
                    setState(() {
                      userInput += buttons[index];
                    });
                  }
                }),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 4),
              )
            ],
          ),
        ),
      ),
    );
  }

  evaluateExpression() {
    Expression exp = Expression(userInput.replaceAll('x', '*'));
    print(exp.eval().toString());

    answer = exp.eval().toString();
    setState(() {});
  }
}

isOperator(data) {
  return data == "+" ||
      data == "-" ||
      data == "/" ||
      data == "x" ||
      data == "%" ||
      data == "DEL" ||
      data == "C" ||
      data == '+/-';
}

getNumberView(number, callback) {
  return GestureDetector(
    onTap: callback,
    child: Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isOperator(number) ? Colors.amber : Colors.black),
      child: Center(
        child: Text(
          number!!,
          style: TextStyle(
              fontSize: 25,
              color: isOperator(number) ? Colors.white : Colors.amber),
        ),
      ),
    ),
  );
}
