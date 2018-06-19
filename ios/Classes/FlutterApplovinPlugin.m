#import "FlutterApplovinPlugin.h"
#import <AppLovinSDK/AppLovinSDK.h>


@interface FlutterApplovinPlugin() <ALAdLoadDelegate>
@property (nonatomic, strong) ALAd *ad;
@end

@implementation FlutterApplovinPlugin

- (void)loadInterstitialAd
{
    // Load an interstitial ad and be notified when the ad request is finished.
    [[ALSdk shared].adService loadNextAd: [ALAdSize sizeInterstitial] andNotify: self];
}

#pragma mark - Ad Load Delegate

- (void)adService:(nonnull ALAdService *)adService didLoadAd:(nonnull ALAd *)ad
{
    // We now have an interstitial ad we can show!
    self.ad = ad;
}

- (void)adService:(nonnull ALAdService *)adService didFailToLoadAdWithError:(int)code
{
    // Look at ALErrorCodes.h for the list of error codes.
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_applovin"
            binaryMessenger:[registrar messenger]];
  FlutterApplovinPlugin* instance = [[FlutterApplovinPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
    [ALSdk initializeSdk];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    switch(call.method) {
        case "loadInterstitial":
            [self loadInterstitialAd];
            break;
        case "showInterstitial":
            [[ALInterstitialAd shared] showOver: [UIApplication sharedApplication].keyWindow andRender: self.ad];
            break;
        default:
            result(FlutterMethodNotImplemented);
            break;
    }
}

@end
