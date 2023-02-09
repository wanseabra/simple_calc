class CalculatorBrain {
  late double _number1;
  late double _number2;
  late Function? _operation;
  late Function? _cacheOperation;

  void clear() {
    _number1 = 0;
    _number2 = 0;
    _operation = null;
    _cacheOperation = null;
  }

  void updateCacheOperation(){
    _cacheOperation = _operation;
  }

  void releaseCacheOperation(){
    _operation = _cacheOperation;
  }

  double result() {
    return _operation!(_number1, _number2);
  }

  double finalResult() {
    return _operation!(_number1, _number2);
  }

  set number1(double value) {
    _number1 = value;
  }

  set operation(Function value) {
    _operation = value;
  }

  set number2(double value) {
    _number2 = value;
  }
}

double sum(double number1, double number2) {
  return (number1 + number2);
}

double divide(double number1, double number2) {
  return (number1 / number2);
}

double subtraction(double number1, double number2) {
  return (number1 - number2);
}

double multiplication(double number1, double number2) {
  return (number1 * number2);
}

double percentage (double number1, double number2){
  return ((number2*number1)/100);
}