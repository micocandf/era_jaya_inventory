import 'package:get/get.dart';

import '../controllers/product_page_buffet_controller.dart';

class ProductPageBuffetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPageBuffetController>(
      () => ProductPageBuffetController(),
    );
  }
}
