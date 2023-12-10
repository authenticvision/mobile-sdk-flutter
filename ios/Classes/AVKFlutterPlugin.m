#import "AVKFlutterPlugin.h"

@import AuthenticVisionSDK;

@interface AVKFlutterPlugin () <AVKScanViewControllerDelegate>
@property (nonatomic, readonly) UIViewController *flutterVC;
@property (nonatomic, strong) FlutterResult result;
@end

@implementation AVKFlutterPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"authentic_vision_sdk" binaryMessenger:[registrar messenger]];
    AVKFlutterPlugin *instance = [[AVKFlutterPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"getSdkVersion" isEqualToString:call.method]) {
        result([@"AuthenticVisionSDK " stringByAppendingString:[AVKVersionInfo sdkVersion]]);
    } else if ([@"scanOneLabel" isEqualToString:call.method]) {
        AVKScanConfig *scanConfig = [AVKScanConfig defaultScanConfig];
        scanConfig.apiKey = @""; // TODO: API key here
        scanConfig.endpoints = [AVKScanConfig endpointsTesting];
        scanConfig.includeGeoLocationData = false;
        NSError *error = nil;
        AVKScanViewController *controller = [AVKScanViewController scanViewControllerWithDelegate:self error:&error];
        self.result = result;
        [self.flutterVC presentViewController:controller animated:YES completion:nil];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (UIViewController *)flutterVC {
    return [UIApplication sharedApplication].delegate.window.rootViewController;
}

- (void)scanViewController:(nonnull AVKScanViewController *)controller scanDidCompleteWithResult:(AVKScanResult *)result {
    if (self.result) {
        if (!result.SLID) {
            self.result(@"no SLID available");
        } else if (result.authentic) {
            self.result([NSString stringWithFormat:@"AUTHENTIC: %@", result.SLID]);
        } else {
            self.result([NSString stringWithFormat:@"not authentic: %@", result.SLID]);
        }
        self.result = nil;
        [controller dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)scanViewController:(nonnull AVKScanViewController *)controller unrecoverableError:(NSError *)error {
    if (self.result) {
        self.result([NSString stringWithFormat:@"error: %@", error.localizedDescription]);
        self.result = nil;
        [controller dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
