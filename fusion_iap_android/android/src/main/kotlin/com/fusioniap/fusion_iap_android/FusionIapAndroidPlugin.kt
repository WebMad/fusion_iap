package com.fusioniap.fusion_iap_android

import androidx.annotation.NonNull
import com.android.billingclient.api.BillingClient
import com.android.billingclient.api.PurchasesUpdatedListener

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FusionIapAndroidPlugin */
class FusionIapAndroidPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "fusion_iap_android")
        channel.setMethodCallHandler(this)

        val purchasesUpdatedListener = PurchasesUpdatedListener { billingResult, purchases ->
            /// TODO: implement
        }

        BillingClient.newBuilder(flutterPluginBinding.applicationContext)
            .setListener(purchasesUpdatedListener).enablePendingPurchases().build();
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
