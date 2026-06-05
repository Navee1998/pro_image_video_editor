import '../../../shared/extensions/export_bool_extension.dart';
import '../../../shared/utils/parser/bool_parser.dart';

/// A class representing the interaction settings for a layer.
///
/// The `LayerInteraction` class defines the enablement of various interaction
/// capabilities for a layer, including moving, scaling, rotating, and
/// selection.
class LayerInteraction {
  /// Creates a new instance of [LayerInteraction] with customizable
  /// interaction settings.
  ///
  /// All interaction settings are enabled by default unless specified
  /// otherwise.
  ///
  /// - [enableMove]: Enables the ability to move the layer.
  /// - [enableScale]: Enables the ability to scale the layer.
  /// - [enableRotate]: Enables the ability to rotate the layer.
  /// - [enableSelection]: Enables the ability to select the layer.
  /// - [enableEdit]: Enables the ability to edit the layer.
  LayerInteraction({
    this.enableMove = true,
    this.enableScale = true,
    this.enableRotate = true,
    this.enableSelection = true,
    this.enableEdit = true,
  });

  /// Creates a [LayerInteraction] instance from a [Map].
  ///
  /// - [map]: The map containing interaction settings with keys matching
  ///   the property names.
  /// - [keyConverter]: An optional function to convert keys from the map to
  ///   match the property names. Defaults to identity mapping.
  factory LayerInteraction.fromMap(
    Map<String, dynamic> map, {
    Function(String key)? keyConverter,
  }) {
    keyConverter ??= (String key) => key;

    return LayerInteraction(
      enableMove: safeParseBool(
        map[keyConverter('enableMove')],
        fallback: true,
      ),
      enableScale: safeParseBool(
        map[keyConverter('enableScale')],
        fallback: true,
      ),
      enableRotate: safeParseBool(
        map[keyConverter('enableRotate')],
        fallback: true,
      ),
      enableSelection: safeParseBool(
        map[keyConverter('enableSelection')],
        fallback: true,
      ),
      enableEdit: safeParseBool(
        map[keyConverter('enableEdit')],
        fallback: true,
      ),
    );
  }

  /// Creates a [LayerInteraction] instance with all interaction properties
  /// set to the specified [value].
  ///
  /// The [value] parameter is used to set the following properties:
  /// - [enableMove]
  /// - [enableScale]
  /// - [enableRotate]
  /// - [enableSelection]
  /// - [enableEdit]
  ///
  /// This factory constructor allows for quick initialization of a
  /// [LayerInteraction] object with uniform interaction capabilities.
  factory LayerInteraction.fromDefaultValue(bool value) {
    return LayerInteraction(
      enableMove: value,
      enableScale: value,
      enableRotate: value,
      enableSelection: value,
      enableEdit: value,
    );
  }

  /// Whether moving the layer is enabled.
  bool enableMove;

  /// Whether scaling the layer is enabled.
  bool enableScale;

  /// Whether rotating the layer is enabled.
  bool enableRotate;

  /// Whether selecting the layer is enabled.
  bool enableSelection;

  /// Whether the layer is editable. This option currently affects only
  /// TextLayers or WidgetLayers when the onTapEditSticker callback is set.
  bool enableEdit;

  /// Enables or disables all interaction capabilities for a layer.
  ///
  /// The following interactions can be enabled or disabled:
  /// - Editing
  /// - Moving
  /// - Scaling
  /// - Rotating
  /// - Selection
  ///
  /// Each interaction is controlled by the `value` parameter.
  ///
  /// Parameters:
  /// - `value` (bool): The value to set for enabling or disabling the
  ///   interactions.
  void toggleAll(bool enableInteraction) {
    enableEdit = enableInteraction;
    enableMove = enableInteraction;
    enableScale = enableInteraction;
    enableRotate = enableInteraction;
    enableSelection = enableInteraction;
  }

  /// Creates a copy of this [LayerInteraction] with optional overrides.
  ///
  /// - [enableMove]: If provided, overrides the current `enableMove` setting.
  /// - [enableScale]: If provided, overrides the current `enableScale` setting.
  /// - [enableRotate]: If provided, overrides the current `enableRotate`
  ///   setting.
  /// - [enableSelection]: If provided, overrides the current `enableSelection`
  ///   setting.
  /// - [enableEdit]: if provided, overrides the current `enableEdit`
  ///   setting.
  LayerInteraction copyWith({
    bool? enableMove,
    bool? enableScale,
    bool? enableRotate,
    bool? enableSelection,
    bool? enableEdit,
  }) {
    return LayerInteraction(
      enableMove: enableMove ?? this.enableMove,
      enableScale: enableScale ?? this.enableScale,
      enableRotate: enableRotate ?? this.enableRotate,
      enableSelection: enableSelection ?? this.enableSelection,
      enableEdit: enableEdit ?? this.enableEdit,
    );
  }

  /// Converts this [LayerInteraction] instance into a [Map].
  ///
  /// Returns a map representation of the interaction settings with keys
  /// corresponding to the property names.
  Map<String, dynamic> toMap({bool enableMinify = false}) {
    return {
      'enableMove': enableMove.minify(enableMinify),
      'enableScale': enableScale.minify(enableMinify),
      'enableRotate': enableRotate.minify(enableMinify),
      'enableSelection': enableSelection.minify(enableMinify),
      'enableEdit': enableEdit.minify(enableMinify),
    };
  }

  /// Converts this [LayerInteraction] instance into a [Map] while comparing
  /// it to another reference [LayerInteraction].
  ///
  /// Only includes the properties where the current instance's values differ
  /// from the [interaction] reference.
  Map<String, dynamic> toMapFromReference(
    LayerInteraction interaction, {
    bool enableMinify = false,
  }) {
    return {
      if (interaction.enableMove != enableMove)
        'enableMove': enableMove.minify(enableMinify),
      if (interaction.enableScale != enableScale)
        'enableScale': enableScale.minify(enableMinify),
      if (interaction.enableRotate != enableRotate)
        'enableRotate': enableRotate.minify(enableMinify),
      if (interaction.enableSelection != enableSelection)
        'enableSelection': enableSelection.minify(enableMinify),
      if (interaction.enableEdit != enableEdit)
        'enableEdit': enableEdit.minify(enableMinify),
    };
  }

  /// Returns a string representation of the [LayerInteraction] instance.
  @override
  String toString() {
    return 'LayerInteraction(enableMove: $enableMove, '
        'enableScale: $enableScale, '
        'enableRotate: $enableRotate, '
        'enableSelection: $enableSelection, '
        'enableEdit: $enableEdit)';
  }

  /// Compares this [LayerInteraction] instance with another for equality.
  ///
  /// Two [LayerInteraction] instances are considered equal if all their
  /// properties match.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LayerInteraction &&
        other.enableMove == enableMove &&
        other.enableScale == enableScale &&
        other.enableRotate == enableRotate &&
        other.enableSelection == enableSelection &&
        other.enableEdit == enableEdit;
  }

  /// Returns a hash code for this [LayerInteraction] instance.
  @override
  int get hashCode {
    return enableMove.hashCode ^
        enableScale.hashCode ^
        enableRotate.hashCode ^
        enableSelection.hashCode ^
        enableEdit.hashCode;
  }
}
