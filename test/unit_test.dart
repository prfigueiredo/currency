import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

void main() {
  group('Testing currency converter', () { 
    test('BRL currency to USD/EUR - positive values', () {
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
    test('BRL currency to USD/EUR - negative values', () {
      //setup
      double? reais = -12;
      double? euros = -2.16;
      double? dolares = -2.36;
      //do
      double? outputUSD = reais/dolares;
      double? outputEUR = reais/euros;
      //test
      expect(outputUSD, closeTo(5.08, 0.01));
      expect(outputEUR, closeTo(5.55, 0.01));
    });
  });
}