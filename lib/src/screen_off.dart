import 'screen_off_method_channel.dart';
import 'screen_off_platform_interface.dart';

/// Provides static methods to control the device screen state (on/off).
class ScreenOff {
  // Private constructor to prevent instantiation
  ScreenOff._();

  static final ScreenOffPlatformInterface _platform = ScreenOffMethodChannel();

  /// Turns the device screen off using the platform-specific implementation.
  static Future<void> turnScreenOff() async {
    await _platform.turnScreenOff();
  }

  /// Turns the device screen on using the platform-specific implementation.
  static Future<void> turnScreenOn() async {
    await _platform.turnScreenOn();
  }
}
