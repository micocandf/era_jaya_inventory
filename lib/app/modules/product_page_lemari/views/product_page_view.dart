import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:era_jaya_inventory/app/modules/home/controllers/home_controller.dart';
import 'package:era_jaya_inventory/app/modules/product_page_lemari/views/widgets/productItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/colors_assets.dart';
import '../controllers/product_page_controller.dart';

class ProductPageView extends GetView<ProductPageController> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Barang",
          style: GoogleFonts.inter(fontSize: 15, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: MyColors.greyText),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streammData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data!.docs;

            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) {
                return productItem(
                    image:
                        "${(listAllDocs[index].data() as Map<String, dynamic>)['gambar']}",
                    name:
                        "${(listAllDocs[index].data() as Map<String, dynamic>)['nama_barang']}",
                    dateOne:
                        "${(listAllDocs[index].data() as Map<String, dynamic>)['tanggal_masuk']}",
                    dateTwo:
                        "${(listAllDocs[index].data() as Map<String, dynamic>)['tanggal_keluar']}",
                    itemCount:
                        "${(listAllDocs[index].data() as Map<String, dynamic>)['jumlah']}");
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
