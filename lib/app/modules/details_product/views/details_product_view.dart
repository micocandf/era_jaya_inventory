import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:era_jaya_inventory/app/global/colors_assets.dart';
import 'package:era_jaya_inventory/app/modules/details_product/views/widgets/card_item_one.dart';
import 'package:era_jaya_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/details_product_controller.dart';

class DetailsProductView extends GetView<DetailsProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: MyColors.greyText),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Detail Produk',
            style: GoogleFonts.inter(fontSize: 13, color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<DocumentSnapshot<Object?>>(
              future: controller.getData(Get.arguments),
              builder: (context, snapshot) {
                var data = snapshot.data!.data() as Map<String, dynamic>;
                return cardItemOne(
                    image: "${data["gambar"]}",
                    name: "${data["nama_barang"]}",
                    entryDate: "${data["tanggal_masuk"]}",
                    returDate: '-',
                    kodeBarang: "${data["kode_barang"]}",
                    condition: "${data["kondisi"]}",
                    quantity: "${data["quantity"]}",
                    rawMaterial: "${data["jenis_bahan"]}",
                    // quantity: "${data["kode_barang"]}",
                    );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                onPressed: () => controller.deleteData(Get.arguments),
                child: Row(
                  children: [
                    Icon(Icons.delete, color: MyColors.mainColor),
                    Text(
                      'Delete',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Get.toNamed(Routes.EDIT_PRODUCT, arguments: Get.arguments);
                },
                child: Row(
                  children: [
                    Icon(Icons.edit, color: MyColors.mainColor),
                    Text(
                      'Edit',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),              
            ],
          ),
        ),
      ),// 
    );
  }
}