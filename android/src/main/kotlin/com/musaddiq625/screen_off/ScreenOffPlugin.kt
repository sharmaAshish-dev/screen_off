package com.musaddiq625.screen_off

import android.content.Context
import android.os.PowerManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class ScreenOffPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private var wakeLock: PowerManager.WakeLock? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "screen_off")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        val powerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager

        when (call.method) {
            "turnScreenOff" -> {
                if (wakeLock == null || !wakeLock!!.isHeld) {
                    wakeLock = powerManager.newWakeLock(
                        PowerManager.PROXIMITY_SCREEN_OFF_WAKE_LOCK,
                        "ScreenOffPlugin::ProximityLock"
                    )
                    wakeLock?.acquire()
                }
                result.success("Screen off (wakeLock acquired)")
            }
            "turnScreenOn" -> {
                if (wakeLock?.isHeld == true) {
                    wakeLock?.release()
                }
                result.success("Screen on (wakeLock released)")
            }
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
