import 'package:get/get.dart';

import '../controllers/product_page_meja_controller.dart';

class ProductPageMejaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPageMejaController>(
      () => ProductPageMejaController(),
    );
  }
}
