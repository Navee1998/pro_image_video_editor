import 'dart:ui';

import '/core/constants/editor_shader_constants.dart';

/// A singleton class that manages and caches fragment shaders for different
/// modes.
class ShaderManager {
  /// Private constructor to enforce singleton pattern.
  ShaderManager._();

  /// The singleton instance of `ShaderManager`.
  static final ShaderManager instance = ShaderManager._();

  /// A future to ensure the shader is loaded only once.
  Future<void>? _loadingFuture;

  /// A map that stores loaded shaders by their mode.
  final Map<ShaderMode, FragmentShader> shaders = {};

  /// Whether [ImageFilter.shader] is supported on the current backend.
  bool get isShaderFilterSupported => ImageFilter.isShaderFilterSupported;

  /// Checks if a shader for the given [mode] is already loaded.
  bool containsShader(ShaderMode mode) => shaders.containsKey(mode);

  /// Loads a shader for the given [mode].
  /// If the shader is already loaded, it returns the cached version.
  /// Otherwise, it asynchronously loads and caches the shader.
  Future<FragmentShader> loadShader(ShaderMode mode) async {
    assert(
      isShaderFilterSupported,
      'Shader filters are not supported on the current backend.',
    );

    if (shaders[mode] != null) return shaders[mode]!;

    _loadingFuture ??= _loadShader(mode);
    await _loadingFuture;

    return shaders[mode]!;
  }

  /// Internal method to asynchronously load a shader from an asset path.
  Future<void> _loadShader(ShaderMode mode) async {
    String path = '';

    switch (mode) {
      case ShaderMode.pixelate:
        path = kImageEditorPixelateShaderPath;
        break;
    }

    var program = await FragmentProgram.fromAsset(path);

    shaders[mode] = program.fragmentShader();
  }
}

/// Enum representing different shader modes.
enum ShaderMode {
  /// Applies a pixelation effect to the image.
  pixelate,
}
