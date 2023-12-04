
import 'authentic_vision_sdk_platform_interface.dart';

class AuthenticVisionSdk {
  Future<String?> getPlatformVersion() {
    return AuthenticVisionSdkPlatform.instance.getPlatformVersion();
  }
}
