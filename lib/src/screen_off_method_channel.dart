import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screen_off_platform_interface.dart';

/// An implementation of [ScreenOffPlatformInterface] that uses method channels.
class ScreenOffMethodChannel implements ScreenOffPlatformInterface {
  /// The method channel used to interact with the native platform.
  static const MethodChannel _channel = MethodChannel('screen_off');

  /// Calls the native 'turnScreenOff' method via the method channel.
  ///
  /// Catches and prints [PlatformException] if the native call fails, then rethrows it.
  @override
  Future<void> turnScreenOff() async {
    try {
      await _channel.invokeMethod('turnScreenOff');
    } on PlatformException catch (e) {
      // Consider logging the error to a crash reporting service
      debugPrint("Error turning screen off: ${e.message}");
      rethrow;
    }
  }

  /// Calls the native 'turnScreenOn' method via the method channel.
  ///
  /// Catches and prints [PlatformException] if the native call fails, then rethrows it.
  @override
  Future<void> turnScreenOn() async {
    try {
      await _channel.invokeMethod('turnScreenOn');
    } on PlatformException catch (e) {
      // Consider logging the error to a crash reporting service
      debugPrint("Error turning screen on: ${e.message}");
      rethrow;
    }
  }
}
