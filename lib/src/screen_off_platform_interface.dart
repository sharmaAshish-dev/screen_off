/// The interface that implementations of screen_off must implement.
///
/// Platform implementations should extend this class rather than implement it as `screen_off`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [ScreenOffPlatformInterface] methods.
abstract class ScreenOffPlatformInterface {
  /// Turns the device screen off.
  Future<void> turnScreenOff();

  /// Turns the device screen on.
  Future<void> turnScreenOn();
}
