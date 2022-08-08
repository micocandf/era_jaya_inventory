import 'package:get/get.dart';

import '../controllers/report_pdf_controller.dart';

class ReportPdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportPdfController>(
      () => ReportPdfController(),
    );
  }
}
