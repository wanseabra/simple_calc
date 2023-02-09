import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'brain.dart';
import 'customButton.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  runApp(const MyCalc());
}

class MyCalc extends StatefulWidget {
  const MyCalc({Key? key}) : super(key: key);

  @override
  State<MyCalc> createState() => _MyCalcState();
}

class _MyCalcState extends State<MyCalc> {
  String operation = '';

  double number1 = 0;
  double number2 = 0;
  String historic = '';
  double result = 0;

  String displayNumber = '';

  CalculatorBrain calculator = CalculatorBrain();

  void setUpOperation(
    String displayOperation,
    Function operationFunction,
    String number,
  ) {
    if (operation == '' && displayNumber != '') {
      operation = displayOperation;
      calculator.operation = operationFunction;
      number1 = double.parse(number);
      historic = '$number$displayOperation';
      displayNumber = '';
    }
  }

  void resetDisplay() {
    number1 = 0;
    number2 = 0;
    displayNumber = '';
    historic = '';
    operation = '';
    calculator.clear();
    result = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Simple Calculator"),
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        historic,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        displayNumber.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 80),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            keyboard(),
          ],
        ),
      ),
    );
  }

  Flexible keyboard() {
    return Flexible(
            flex: 2,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(
                        label: '%',
                        buttonColor: (Colors.grey[900])!,
                        onPressed: () {
                          setState(() {
                            if (operation != '') {
                              calculator.number1 = number1;
                              calculator.number2 = double.parse(displayNumber);
                              calculator.updateCacheOperation();
                              calculator.operation = percentage;
                              number2 = calculator.result();
                              displayNumber = number2.toString();
                              calculator.releaseCacheOperation();
                            } else{
                              resetDisplay();
                            }
                          });
                        },
                      ),
                      Button(
                        label: '/',
                        buttonColor: (Colors.grey[900])!,
                        onPressed: () {
                          setState(() {
                            setUpOperation('/', divide, displayNumber);
                          });
                        },
                      ),
                      Button(
                        label: 'C',
                        buttonColor: (Colors.grey[900])!,
                        onPressed: () {
                          setState(() {
                            resetDisplay();
                          });
                        },
                      ),
                      Button(
                        label: '<x',
                        buttonColor: (Colors.grey[900])!,
                        onPressed: (){
                          setState(() {
                            displayNumber = removeLastCharacter(displayNumber);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(
                        label: '7',
                        buttonColor: (Colors.grey[800])!,
                        onPressed: () {
                          setState(() {
                            if (result != 0){
                              resetDisplay();
                            }
                            var number = 7.toString();
                            displayNumber = '$displayNumber$number';
                          });
                        },
                      ),
                      Button(
                        label: '8',
                        buttonColor: (Colors.grey[800])!,
                        onPressed: () {
                          setState(() {
                            if (result != 0){
                              resetDisplay();
                            }
                            var number = 8.toString();
                            displayNumber = '$displayNumber$number';
                          });
                        },
                      ),
                      Button(
                        label: '9 ',
                        buttonColor: (Colors.grey[800])!,
                        onPressed: () {
                          setState(() {
                            if (result != 0){
                              resetDisplay();
                            }
                            var number = 9.toString();
                            displayNumber = '$displayNumber$number';
                          });
                        },
                      ),
                      Button(
                        label: 'X',
                        buttonColor: (Colors.grey[900])!,
                        onPressed: () {
                          setState(() {
                            setUpOperation(
                                'x', multiplication, displayNumber);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(
                        label: '4',
                        buttonColor: (Colors.grey[800])!,
                        onPressed: () {
                          setState(() {
                            if (result != 0){
                              resetDisplay();
                            }
                            var number = 4.toString();
                            displayNumber = '$displayNumber$number';
                          });
                        },
                      ),
                      Button(
                        label: '5',
                        buttonColor: (Colors.grey[800])!,
                        onPressed: () {
                          setState(() {
                            if (result != 0){
                              resetDisplay();
                            }
                            var number = 5.toString();
                            displayNumber = '$displayNumber$number';
                          });
                        },
                      ),
                      Button(
                        label: '6',
                        buttonColor: (Colors.grey[800])!,
                        onPressed: () {
                          setState(() {
                            if (result != 0){
                              resetDisplay();
                            }
                            var number = 6.toString();
                            displayNumber = '$displayNumber$number';
                          });
                        },
                      ),
                      Button(
                        label: '-',
                        buttonColor: (Colors.grey[900])!,
                        onPressed: () {
                          setState(() {
                            setUpOperation('-', subtraction, displayNumber);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(
                        label: '1',
                        buttonColor: (Colors.grey[800])!,
                        onPressed: () {
                          setState(() {
                            if (result != 0){
                              resetDisplay();
                            }
                            var number = 1.toString();
                            displayNumber = '$displayNumber$number';
                          });
                        },
                      ),
                      Button(
                        label: '2',
                        buttonColor: (Colors.grey[800])!,
                        onPressed: () {
                          setState(() {
                            if (result != 0){
                              resetDisplay();
                            }
                            var number = 2.toString();
                            displayNumber = '$displayNumber$number';
                          });
                        },
                      ),
                      Button(
                        label: '3',
                        buttonColor: (Colors.grey[800])!,
                        onPressed: () {
                          setState(() {
                            if (result != 0){
                              resetDisplay();
                            }
                            var number = 3.toString();
                            displayNumber = '$displayNumber$number';
                          });
                        },
                      ),
                      Button(
                        label: '+',
                        buttonColor: (Colors.grey[900])!,
                        onPressed: () {
                          setState(() {
                            setUpOperation('+', sum, displayNumber);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(
                        label: '+/-',
                        buttonColor: (Colors.grey[800])!,
                        onPressed: (){
                          setState(() {
                            if (displayNumber.contains('-')){
                              displayNumber.replaceAll('-', '');
                            }
                            displayNumber = '-$displayNumber';
                          });
                        },
                      ),
                      Button(
                        label: '0',
                        buttonColor: (Colors.grey[800])!,
                        onPressed: () {
                          setState(() {
                            if (result != 0){
                              resetDisplay();
                            }
                            var number = 0.toString();
                            if (!(displayNumber == '0')) {
                              displayNumber = '$displayNumber$number';
                            }
                          });
                        },
                      ),
                      Button(
                        label: ',',
                        buttonColor: (Colors.grey[800])!,
                        onPressed: () {
                          setState(() {
                            var comma = '.';
                            if (!(displayNumber.contains(comma))) {
                              displayNumber = '$displayNumber$comma';
                            }
                          });
                        },
                      ),
                      Button(
                        label: '=',
                        buttonColor: (Colors.grey[700])!,
                        onPressed: () {
                          setState(() {
                            if (number2 ==0){
                              number2 = double.parse(displayNumber);
                            }
                            historic = '$historic$displayNumber';
                            calculator.number1 = number1;
                            calculator.number2 = number2;
                            result = calculator.result();
                            displayNumber = result.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

String removeLastCharacter(String string){
  if (string.isNotEmpty) {
    string = string.substring(0, string.length - 1);
  }
  return string;
}
