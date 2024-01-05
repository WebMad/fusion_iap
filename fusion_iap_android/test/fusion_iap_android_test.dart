import 'package:flutter_test/flutter_test.dart';
import 'package:fusion_iap_android/fusion_iap_android.dart';
import 'package:fusion_iap_android/fusion_iap_android_platform_interface.dart';
import 'package:fusion_iap_android/fusion_iap_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFusionIapAndroidPlatform
    with MockPlatformInterfaceMixin
    implements FusionIapAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FusionIapAndroidPlatform initialPlatform = FusionIapAndroidPlatform.instance;

  test('$MethodChannelFusionIapAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFusionIapAndroid>());
  });

  test('getPlatformVersion', () async {
    FusionIapAndroid fusionIapAndroidPlugin = FusionIapAndroid();
    MockFusionIapAndroidPlatform fakePlatform = MockFusionIapAndroidPlatform();
    FusionIapAndroidPlatform.instance = fakePlatform;

    expect(await fusionIapAndroidPlugin.getPlatformVersion(), '42');
  });
}
