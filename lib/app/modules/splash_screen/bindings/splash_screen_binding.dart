import 'package:era_jaya_inventory/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(
      () => SplashScreenController(),
    );
     Get.lazyPut<HomeView>(
      () => HomeView(),
    );
  }
}
