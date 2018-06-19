import 'dart:async';

import 'package:flutter/services.dart';

class FlutterApplovin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_applovin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
