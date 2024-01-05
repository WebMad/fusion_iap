import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fusion_iap_android_method_channel.dart';

abstract class FusionIapAndroidPlatform extends PlatformInterface {
  /// Constructs a FusionIapAndroidPlatform.
  FusionIapAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static FusionIapAndroidPlatform _instance = MethodChannelFusionIapAndroid();

  /// The default instance of [FusionIapAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelFusionIapAndroid].
  static FusionIapAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FusionIapAndroidPlatform] when
  /// they register themselves.
  static set instance(FusionIapAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
