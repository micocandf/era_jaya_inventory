import 'package:get/get.dart';

import 'package:era_jaya_inventory/app/modules/details_product/bindings/details_product_binding.dart';
import 'package:era_jaya_inventory/app/modules/details_product/views/details_product_view.dart';
import 'package:era_jaya_inventory/app/modules/edit_product/bindings/edit_product_binding.dart';
import 'package:era_jaya_inventory/app/modules/edit_product/views/edit_product_view.dart';
import 'package:era_jaya_inventory/app/modules/get_laporan_page/bindings/get_laporan_page_binding.dart';
import 'package:era_jaya_inventory/app/modules/get_laporan_page/views/get_laporan_page_view.dart';
import 'package:era_jaya_inventory/app/modules/home/bindings/home_binding.dart';
import 'package:era_jaya_inventory/app/modules/home/views/home_view.dart';
import 'package:era_jaya_inventory/app/modules/product_page_buffet/bindings/product_page_buffet_binding.dart';
import 'package:era_jaya_inventory/app/modules/product_page_buffet/views/product_page_buffet_view.dart';
import 'package:era_jaya_inventory/app/modules/product_page_kasur/bindings/product_page_kasur_binding.dart';
import 'package:era_jaya_inventory/app/modules/product_page_kasur/views/product_page_kasur_view.dart';
import 'package:era_jaya_inventory/app/modules/product_page_kursi/bindings/product_page_kursi_binding.dart';
import 'package:era_jaya_inventory/app/modules/product_page_kursi/views/product_page_kursi_view.dart';
import 'package:era_jaya_inventory/app/modules/product_page_lemari/bindings/product_page_binding.dart';
import 'package:era_jaya_inventory/app/modules/product_page_lemari/views/product_page_view.dart';
import 'package:era_jaya_inventory/app/modules/product_page_meja/bindings/product_page_meja_binding.dart';
import 'package:era_jaya_inventory/app/modules/product_page_meja/views/product_page_meja_view.dart';
import 'package:era_jaya_inventory/app/modules/product_page_rak/bindings/product_page_rak_binding.dart';
import 'package:era_jaya_inventory/app/modules/product_page_rak/views/product_page_rak_view.dart';
import 'package:era_jaya_inventory/app/modules/report_pdf/bindings/report_pdf_binding.dart';
import 'package:era_jaya_inventory/app/modules/report_pdf/views/report_pdf_view.dart';
import 'package:era_jaya_inventory/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:era_jaya_inventory/app/modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => splashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_PAGE,
      page: () => ProductPageView(),
      binding: ProductPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS_PRODUCT,
      page: () => DetailsProductView(),
      binding: DetailsProductBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => EditProductView(),
      binding: EditProductBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_PDF,
      page: () => ReportPdfView(),
      binding: ReportPdfBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_PAGE_MEJA,
      page: () => ProductPageMejaView(),
      binding: ProductPageMejaBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_PAGE_KURSI,
      page: () => ProductPageKursiView(),
      binding: ProductPageKursiBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_PAGE_KASUR,
      page: () => ProductPageKasurView(),
      binding: ProductPageKasurBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_PAGE_RAK,
      page: () => ProductPageRakView(),
      binding: ProductPageRakBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_PAGE_BUFFET,
      page: () => ProductPageBuffetView(),
      binding: ProductPageBuffetBinding(),
    ),
    GetPage(
      name: _Paths.GET_LAPORAN_PAGE,
      page: () => GetLaporanPageView(),
      binding: GetLaporanPageBinding(),
    ),
  ];
}
