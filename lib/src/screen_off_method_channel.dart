import 'package:flutter/services.dart';

import 'screen_off_platform_interface.dart';

class ScreenOffMethodChannel implements ScreenOffPlatformInterface {
  static const MethodChannel _channel = MethodChannel('screen_off');

  @override
  Future<void> turnScreenOff() async {
    try {
      await _channel.invokeMethod('turnScreenOff');
    } on PlatformException catch (e) {
      print("Error turning screen off: ${e.message}");
    }
  }

  @override
  Future<void> turnScreenOn() async {
    try {
      await _channel.invokeMethod('turnScreenOn');
    } on PlatformException catch (e) {
      print("Error turning screen on: ${e.message}");
    }
  }
}
