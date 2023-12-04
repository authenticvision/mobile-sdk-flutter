import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'authentic_vision_sdk_platform_interface.dart';

/// An implementation of [AuthenticVisionSdkPlatform] that uses method channels.
class MethodChannelAuthenticVisionSdk extends AuthenticVisionSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('authentic_vision_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}