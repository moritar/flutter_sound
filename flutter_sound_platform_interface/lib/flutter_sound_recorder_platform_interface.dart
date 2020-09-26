import 'dart:async';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_flutter_sound_recorder.dart';

/// The interface that implementations of url_launcher must implement.
///
/// Platform implementations should extend this class rather than implement it as `url_launcher`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [FlutterSoundPlatform] methods.
abstract class FlutterSoundRecorderPlatform extends PlatformInterface {
  /// Constructs a UrlLauncherPlatform.
  FlutterSoundRecorderPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSoundRecorderPlatform _instance = MethodChannelFlutterSoundRecorder();

  /// The default instance of [FlutterSoundRecorderPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterSoundRecorder].
  static FlutterSoundRecorderPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [UrlLauncherPlatform] when they register themselves.
  static set instance(FlutterSoundRecorderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Launches the given [url]. Completes to [true] if the launch was successful.
  Future<bool> launch(String url) {
    throw UnimplementedError('launch() has not been implemented.');
  }
}