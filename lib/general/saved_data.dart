// The main output of the calculator
String calcOut = '';

// The secondary output of the calculator
String lastCalcOut = '';

// The input/main-output of the converter
String convOut1 = '';

// The output where the conversion shows
String convOut2 = '';

// The value of the first dropdownbutton, initializes  with 'EUR'
String ddValue1 = 'EUR';

// The value of the second dropdownbutton, initializes  with 'USD'
String ddValue2 = 'USD';

// The currency rates.
late Map<String, double> ratesGlobal;