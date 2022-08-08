import 'package:get/get.dart';

import '../controllers/product_page_rak_controller.dart';

class ProductPageRakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPageRakController>(
      () => ProductPageRakController(),
    );
  }
}
