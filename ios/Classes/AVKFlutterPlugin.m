#import "AVKFlutterPlugin.h"

@import AuthenticVisionSDK;

@implementation AVKFlutterPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"authentic_vision_sdk" binaryMessenger:[registrar messenger]];
    AVKFlutterPlugin *instance = [[AVKFlutterPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"getSdkVersion" isEqualToString:call.method]) {
        result([@"AuthenticVisionSDK " stringByAppendingString:[AVKVersionInfo sdkVersion]]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
