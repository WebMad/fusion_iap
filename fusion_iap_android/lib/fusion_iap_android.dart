
import 'fusion_iap_android_platform_interface.dart';

class FusionIapAndroid {
  Future<String?> getPlatformVersion() {
    return FusionIapAndroidPlatform.instance.getPlatformVersion();
  }
}
