import 'package:flutter/material.dart';
import 'package:calc/app/feature/calculator/widgets/button_calc.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late String result = '0';
  late String resultDefault = '0';
  late String resultError = 'ОШИБКА';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 22),
                        child: Text(
                          result,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 65,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseButton(
                    text: 'AC',
                    textColor: Colors.black,
                    buttonColor: Colors.grey,
                    onPressed: (text) => clear(),
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: 'C',
                    textColor: Colors.black,
                    buttonColor: Colors.grey,
                    onPressed: (text) => clearOne(),
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: '+/-',
                    textColor: Colors.black,
                    buttonColor: Colors.grey,
                    onPressed: (text) => plusMinus(),
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: '/',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 245, 118, 34),
                    onPressed: (text) => textAdd(text),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseButton(
                    text: '7',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 69, 69, 69),
                    onPressed: (text) => textAdd(text),
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: '8',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 69, 69, 69),
                    onPressed: (text) => textAdd(text),
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: '9',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 69, 69, 69),
                    onPressed: (text) => textAdd(text),
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: 'x',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 245, 118, 34),
                    onPressed: (text) => textAdd(text),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseButton(
                    text: '4',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 69, 69, 69),
                    onPressed: (text) => textAdd(text),
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: '5',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 69, 69, 69),
                    onPressed: (text) => textAdd(text),
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: '6',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 69, 69, 69),
                    onPressed: (text) => textAdd(text),
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: '-',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 245, 118, 34),
                    onPressed: (text) => textAdd(text),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseButton(
                    text: '1',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 69, 69, 69),
                    onPressed: (text) => textAdd(text),
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: '2',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 69, 69, 69),
                    onPressed: (text) => textAdd(text),
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: '3',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 69, 69, 69),
                    onPressed: (text) => textAdd(text),
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: '+',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 245, 118, 34),
                    onPressed: (text) => textAdd(text),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseButton(
                    text: '0',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 69, 69, 69),
                    onPressed: (text) => textAdd(text),
                    isExpanded: true,
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: '.',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 69, 69, 69),
                    onPressed: (text) => textAdd(text),
                  ),
                  const SizedBox(width: 10),
                  BaseButton(
                    text: '=',
                    textColor: Colors.white,
                    buttonColor: const Color.fromARGB(255, 69, 69, 69),
                    onPressed: (text) => calc(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void textAdd(String text) {
    setState(() {
      if (result == resultDefault || result == resultError) {
        result = text;
      } else {
        result += text;
      }
    });
  }

  void clear() {
    setState(() {
      result = resultDefault;
    });
  }

  void calc() {
    try {
      // Заменяем символ 'x' на '*'
      result = result.replaceAll('x', '*');
      Parser p = Parser();
      Expression exp = p.parse(result);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      if (eval == double.infinity) throw '';
      setState(() {
        result = eval.toStringAsFixed(2);
      });
    } catch (e) {
      setState(() {
        result = resultError;
      });
    }
  }

  void clearOne() {
    setState(() {
      result = result.substring(0, result.length - 1);
      if (result == '') result = resultDefault;
    });
  }

  void plusMinus() {
    setState(() {
      if (result[0] == '-') {
        result = result.replaceFirst('-', '');
      } else if (result[0] == '+') {
        result = result.replaceFirst('+', '-');
      } else {
        result = '-$result';
      }
    });
  }
}
