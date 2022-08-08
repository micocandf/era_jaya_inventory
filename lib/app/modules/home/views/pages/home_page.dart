import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:era_jaya_inventory/app/modules/home/views/widgets/widget_history_item.dart';
import 'package:era_jaya_inventory/app/modules/home/views/widgets/widget_category.dart';
import 'package:era_jaya_inventory/app/modules/home/views/widgets/widget_banner.dart';
import 'package:era_jaya_inventory/app/modules/home/controllers/home_controller.dart';
import 'package:era_jaya_inventory/app/global/colors_assets.dart';
import 'package:era_jaya_inventory/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // final productController = Get.find<ProductPageController>();

    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            WidgetBanner(
                total_barang: "10", barang_masuk: "10", barang_keluar: "10"),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kategori",
                    style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            WidgetCategory(
                              icon: Icons.table_chart,
                              name: "Lemari",
                              nextPage: '/product-page',
                            ),
                            SizedBox(width: 5),
                            WidgetCategory(
                                icon: Icons.chair,
                                name: "Kursi",
                                nextPage: Routes.PRODUCT_PAGE_KURSI),
                            SizedBox(width: 5),
                            WidgetCategory(
                              icon: Icons.table_restaurant,
                              name: "Meja",
                              nextPage: Routes.PRODUCT_PAGE_MEJA,
                            ),
                            SizedBox(width: 5),
                            WidgetCategory(
                              icon: Icons.bed,
                              name: "Kasur",
                              nextPage: Routes.PRODUCT_PAGE_KASUR,
                            ),
                            SizedBox(width: 5),
                            WidgetCategory(
                              icon: Icons.bed,
                              name: "Rak",
                              nextPage: Routes.PRODUCT_PAGE_RAK,
                            ),
                            SizedBox(width: 5),
                            WidgetCategory(
                              icon: Icons.radio_button_off_rounded,
                              name: "Buffet",
                              nextPage: Routes.PRODUCT_PAGE_BUFFET,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Riwayat Barang",
                          style: GoogleFonts.inter(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Text(
                        "Selengkapnya",
                        style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: MyColors.mainText),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            StreamBuilder<QuerySnapshot<Object?>>(
              stream: controller.streamData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  var listAllDocs = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: listAllDocs.length,
                    itemBuilder: (context, index) {
                      return listAllDocs != null
                          ? GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  Routes.DETAILS_PRODUCT,
                                  arguments: listAllDocs[index].id,
                                );
                              },
                              child: WidgetHistory(
                                image: listAllDocs != null
                                    ? "${(listAllDocs[index].data() as Map<String, dynamic>)['gambar']}"
                                    : "",
                                itemName: listAllDocs != null
                                    ? "${(listAllDocs[index].data() as Map<String, dynamic>)['nama_barang']}"
                                    : "",
                                ingredient: listAllDocs != null
                                    ? "${(listAllDocs[index].data() as Map<String, dynamic>)['jenis_bahan']}"
                                    : "",
                                dateTime: listAllDocs != null
                                    ? "${(listAllDocs[index].data() as Map<String, dynamic>)['tanggal_masuk']}"
                                    : "-",
                                status: "Masuk",
                                colors: MyColors.cardOne,
                              ),
                            )
                          : Container();
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(height: 20),
          ],
        ),
        // scrollDirection: Axis.vertical,
      ),
    );
  }
}
