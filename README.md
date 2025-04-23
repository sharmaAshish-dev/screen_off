# screen_off

A Flutter plugin to programmatically turn the screen off or on using the proximity sensor. This is especially useful for custom calling apps or scenarios where the screen needs to be turned off when the device is close to the user.

## Features

- 📴 Turn screen off using proximity sensor
- 🔛 Turn screen back on when the sensor is no longer triggered
- Easy to integrate into any Flutter app
- ✅ Works on both **Android** and **iOS**

## Usage

### Android

Add the following permission to your `AndroidManifest.xml` if needed:

```xml
<uses-permission android:name="android.permission.WAKE_LOCK"/>
```
### iOS
No additional setup is required for iOS. Just make sure the app has permission to access the proximity sensor (enabled by default).

### Flutter
```
import 'package:screen_off/screen_off.dart';

/// Turn screen off
await ScreenOff.turnScreenOff();

/// Turn screen on
await ScreenOff.turnScreenOn();
```
### Platform
| Platform | Support |
|----------|---------|
| Android  | ✅      |
| iOS      | ✅      |

### Installation
Add this to your pubspec.yaml:
```
dependencies:
  screen_off: ^0.0.4
```
Then run:
```
flutter pub get
```


If you find it useful, a ⭐ on GitHub is appreciated.

### Maintainer
Developed and maintained by Musaddiq625

### License
This project is licensed under the MIT License - see the LICENSE file for details.