import Flutter
import UIKit

public class ScreenOffPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "screen_off", binaryMessenger: registrar.messenger())
    let instance = ScreenOffPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "turnScreenOff":
        UIDevice.current.isProximityMonitoringEnabled = true  // Enable proximity sensor
        result("Screen off: Proximity sensor enabled.")
    case "turnScreenOn":
        UIDevice.current.isProximityMonitoringEnabled = false // Disable proximity sensor
        result("Screen on: Proximity sensor disabled.")
    default:
        result(FlutterMethodNotImplemented)
    }
  }
}
