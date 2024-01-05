import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fusion_iap_android_platform_interface.dart';

/// An implementation of [FusionIapAndroidPlatform] that uses method channels.
class MethodChannelFusionIapAndroid extends FusionIapAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fusion_iap_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
