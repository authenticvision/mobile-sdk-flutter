import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'authentic_vision_sdk_method_channel.dart';

abstract class AuthenticVisionSdkPlatform extends PlatformInterface {
  /// Constructs a AuthenticVisionSdkPlatform.
  AuthenticVisionSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static AuthenticVisionSdkPlatform _instance =
      MethodChannelAuthenticVisionSdk();

  /// The default instance of [AuthenticVisionSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelAuthenticVisionSdk].
  static AuthenticVisionSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AuthenticVisionSdkPlatform] when
  /// they register themselves.
  static set instance(AuthenticVisionSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getSdkVersion() {
    throw UnimplementedError('getSdkVersion() has not been implemented.');
  }
}
