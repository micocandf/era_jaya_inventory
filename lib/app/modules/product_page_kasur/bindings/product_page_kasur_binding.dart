import 'package:get/get.dart';

import '../controllers/product_page_kasur_controller.dart';

class ProductPageKasurBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPageKasurController>(
      () => ProductPageKasurController(),
    );
  }
}
