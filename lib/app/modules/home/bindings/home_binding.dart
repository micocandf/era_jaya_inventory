import 'package:get/get.dart';

import '../../product_page_lemari/views/product_page_view.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProductPageView>(
      () => ProductPageView(),
    );
  }
}
