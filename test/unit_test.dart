import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing currency converter', () { 
    test('BRL currency to USD/EUR', () {
      //setup
      double? reais = 5000.00;
      double? euros = 892.62;
      double? dolares = 967.96;
      //do
      double? outputUSD = reais/dolares;
      double? outputEUR = reais/euros;
      //test
      expect(outputUSD, closeTo(5.16, 0.01));
      expect(outputEUR, closeTo(5.60, 0.01));
    });
  });
}