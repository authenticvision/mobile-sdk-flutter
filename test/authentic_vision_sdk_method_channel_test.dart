import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:authentic_vision_sdk/authentic_vision_sdk_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAuthenticVisionSdk platform = MethodChannelAuthenticVisionSdk();
  const MethodChannel channel = MethodChannel('authentic_vision_sdk');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getSdkVersion', () async {
    expect(await platform.getSdkVersion(), '42');
  });
}
