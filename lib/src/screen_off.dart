import 'screen_off_method_channel.dart';
import 'screen_off_platform_interface.dart';

class ScreenOff {
  static final ScreenOffPlatformInterface _platform = ScreenOffMethodChannel();

  static Future<void> turnScreenOff() async {
    await _platform.turnScreenOff();
  }

  static Future<void> turnScreenOn() async {
    await _platform.turnScreenOn();
  }
}
