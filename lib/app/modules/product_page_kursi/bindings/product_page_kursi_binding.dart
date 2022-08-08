import 'package:get/get.dart';

import '../controllers/product_page_kursi_controller.dart';

class ProductPageKursiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPageKursiController>(
      () => ProductPageKursiController(),
    );
  }
}
