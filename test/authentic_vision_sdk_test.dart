import 'package:flutter_test/flutter_test.dart';
import 'package:authentic_vision_sdk/authentic_vision_sdk.dart';
import 'package:authentic_vision_sdk/authentic_vision_sdk_platform_interface.dart';
import 'package:authentic_vision_sdk/authentic_vision_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAuthenticVisionSdkPlatform
    with MockPlatformInterfaceMixin
    implements AuthenticVisionSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AuthenticVisionSdkPlatform initialPlatform = AuthenticVisionSdkPlatform.instance;

  test('$MethodChannelAuthenticVisionSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAuthenticVisionSdk>());
  });

  test('getPlatformVersion', () async {
    AuthenticVisionSdk authenticVisionSdkPlugin = AuthenticVisionSdk();
    MockAuthenticVisionSdkPlatform fakePlatform = MockAuthenticVisionSdkPlatform();
    AuthenticVisionSdkPlatform.instance = fakePlatform;

    expect(await authenticVisionSdkPlugin.getPlatformVersion(), '42');
  });
}
