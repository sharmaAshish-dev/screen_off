import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'screen_off_platform_interface.dart';

class ScreenOffMethodChannel implements ScreenOffPlatformInterface {
  static const MethodChannel _channel = MethodChannel('screen_off');

  @override
  Future<void> turnScreenOff() async {
    try {
      await _channel.invokeMethod('turnScreenOff');
    } on PlatformException catch (e) {
      debugPrint("Error turning screen off: ${e.message}");
      rethrow;
    }
  }

  @override
  Future<void> turnScreenOn() async {
    try {
      await _channel.invokeMethod('turnScreenOn');
    } on PlatformException catch (e) {
      debugPrint("Error turning screen on: ${e.message}");
      rethrow;
    }
  }
}
