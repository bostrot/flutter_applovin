# flutter_applovin

A new simple Flutter applovin demonstration plugin. Currently only supports interstitials. Pull 
requests are welcome.

## iOS

In Runner/Info.plist add
    
	<key>AppLovinSdkKey</key
	<string>YOUR_KEY</string>

## Android

Add this in AndroidManifest.xml:

    <meta-data android:name="applovin.sdk.key"
        android:value="YOUR_SDK_KEY_ANDROID"
        />

## Getting Started

Load and show interstitial ad with:

    FlutterApplovin.showInterstitial;

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).
