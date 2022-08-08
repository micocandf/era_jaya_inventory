import 'package:get/get.dart';

import '../controllers/get_laporan_page_controller.dart';

class GetLaporanPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetLaporanPageController>(
      () => GetLaporanPageController(),
    );
  }
}
