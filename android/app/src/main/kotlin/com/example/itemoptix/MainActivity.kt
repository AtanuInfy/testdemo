package com.checkpt.itemoptix.app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "plugins.flutter.checkpt_itemoptix"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            // This method is invoked on the main thread.
                call, result ->
            if (call.method == "ItemOptix_initSDK") {
                println("ItemOptix_initSDK")
            } else if (call.method == "PortalUserManager_registerDevices") {
                val argument = call.arguments
                println("PortalUserManager_registerDevices")
                println("$argument")
            } else {
                result.notImplemented()
            }
        }
    }
}
