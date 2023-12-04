import 'authentic_vision_sdk_platform_interface.dart';

class AuthenticVisionSdk {
  Future<String?> getSdkVersion() {
    return AuthenticVisionSdkPlatform.instance.getSdkVersion();
  }
}
