import 'package:flutter_test/flutter_test.dart';

int aPlusB({required int a, required int b}) => a + b;

void main() {
  test(
    'First Test',
      () {
      final result = aPlusB(a: 2, b: 3);
      expect(result, 5);
      }
  );
}