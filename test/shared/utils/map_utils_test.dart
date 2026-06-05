import 'package:flutter_test/flutter_test.dart';
import 'package:pro_image_editor/shared/utils/map_utils.dart';

void main() {
  group('mapIsEqual', () {
    test('returns true for two identical flat maps', () {
      final a = {'x': 1, 'y': 2};
      final b = {'x': 1, 'y': 2};
      expect(mapIsEqual(a, b), isTrue);
    });

    test('returns false for maps with different keys', () {
      final a = {'x': 1, 'y': 2};
      final b = {'x': 1, 'z': 2};
      expect(mapIsEqual(a, b), isFalse);
    });

    test('returns false for maps with different values', () {
      final a = {'x': 1, 'y': 2};
      final b = {'x': 1, 'y': 3};
      expect(mapIsEqual(a, b), isFalse);
    });

    test('returns true for two identical nested maps', () {
      final a = {
        'x': 1,
        'y': {'a': 10, 'b': 20},
      };
      final b = {
        'x': 1,
        'y': {'a': 10, 'b': 20},
      };
      expect(mapIsEqual(a, b), isTrue);
    });

    test('returns false for nested maps with different values', () {
      final a = {
        'x': 1,
        'y': {'a': 10, 'b': 20},
      };
      final b = {
        'x': 1,
        'y': {'a': 10, 'b': 21},
      };
      expect(mapIsEqual(a, b), isFalse);
    });

    test('returns true for two identical lists', () {
      final a = [1, 2, 3];
      final b = [1, 2, 3];
      expect(mapIsEqual(a, b), isTrue);
    });

    test('returns false for lists with different lengths', () {
      final a = [1, 2, 3];
      final b = [1, 2];
      expect(mapIsEqual(a, b), isFalse);
    });

    test('returns false for lists with different values', () {
      final a = [1, 2, 3];
      final b = [1, 2, 4];
      expect(mapIsEqual(a, b), isFalse);
    });

    test('returns true for nested lists and maps', () {
      final a = [
        {
          'x': 1,
          'y': [2, 3],
        },
        {'z': 4},
      ];
      final b = [
        {
          'x': 1,
          'y': [2, 3],
        },
        {'z': 4},
      ];
      expect(mapIsEqual(a, b), isTrue);
    });

    test('returns false for different types', () {
      final a = {'x': 1};
      final b = [1];
      expect(mapIsEqual(a, b), isFalse);
    });

    test('returns true for identical primitives', () {
      expect(mapIsEqual(5, 5), isTrue);
      expect(mapIsEqual('abc', 'abc'), isTrue);
    });

    test('returns false for different primitives', () {
      expect(mapIsEqual(5, 6), isFalse);
      expect(mapIsEqual('abc', 'def'), isFalse);
    });

    test('returns true for two empty maps', () {
      expect(mapIsEqual({}, {}), isTrue);
    });

    test('returns true for two empty lists', () {
      expect(mapIsEqual([], []), isTrue);
    });

    test('returns true for two nulls', () {
      expect(mapIsEqual(null, null), isTrue);
    });

    test('returns false for null and non-null', () {
      expect(mapIsEqual(null, 1), isFalse);
      expect(mapIsEqual({}, null), isFalse);
    });
  });
}
