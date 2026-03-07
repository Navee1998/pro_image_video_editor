import 'package:flutter/foundation.dart';

import '/core/constants/int_constants.dart';
import '/shared/extensions/num_extension.dart';
import '/shared/utils/parser/double_parser.dart';

/// A class representing the adjustment matrix for a tune adjustment item.
///
/// This class holds the adjustment [id], the [value] of the adjustment, and
/// the corresponding transformation [matrix] that applies the adjustment.
class TuneAdjustmentMatrix {
  /// Creates a [TuneAdjustmentMatrix] instance from a [Map] representation.
  ///
  /// This factory constructor extracts [id], [value], and [matrix] from the
  /// provided [map].
  factory TuneAdjustmentMatrix.fromMap(Map<String, dynamic> map) {
    return TuneAdjustmentMatrix(
      id: map['id']?.toString() ?? '-',
      value: safeParseDouble(map['value']?.toString()),
      matrix: (map['matrix'] as List?)?.map(safeParseDouble).toList() ?? [],
    );
  }

  /// Creates a [TuneAdjustmentMatrix] with the given [id], [value], and
  /// [matrix].
  ///
  /// - [id] is the unique identifier for the adjustment.
  /// - [value] is the adjustment value.
  /// - [matrix] is a list of doubles representing the matrix transformation.
  TuneAdjustmentMatrix({
    required this.id,
    required this.value,
    required this.matrix,
  });

  /// The unique identifier for the tune adjustment.
  final String id;

  /// The value of the tune adjustment.
  final double value;

  /// The transformation matrix associated with the tune adjustment.
  final List<double> matrix;

  /// Converts this [TuneAdjustmentMatrix] instance into a [Map] representation.
  ///
  /// The map contains the [id], [value], and [matrix] as key-value pairs.
  Map<String, dynamic> toMap({int maxDecimalPlaces = kMaxSafeDecimalPlaces}) {
    return {
      'id': id,
      'value': value.roundSmart(maxDecimalPlaces),
      'matrix': matrix
          .map((value) => value.roundSmart(maxDecimalPlaces))
          .toList(),
    };
  }

  /// Creates a copy of this [TuneAdjustmentMatrix] instance with the same
  /// values.
  ///
  /// The [copy] method allows duplicating the matrix with identical properties.
  TuneAdjustmentMatrix copy() {
    return TuneAdjustmentMatrix(id: id, value: value, matrix: [...matrix]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TuneAdjustmentMatrix &&
        other.id == id &&
        other.value == value &&
        listEquals(other.matrix, matrix);
  }

  @override
  int get hashCode => id.hashCode ^ value.hashCode ^ matrix.hashCode;
}
