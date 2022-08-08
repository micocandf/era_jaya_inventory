import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:era_jaya_inventory/app/modules/home/views/widgets/widget_history_item.dart';
import 'package:era_jaya_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../global/colors_assets.dart';
import '../../controllers/home_controller.dart';

class historyPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Riwayat Barang",
            style: GoogleFonts.inter(fontSize: 15, color: Colors.black)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView(        
          children: [
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
                      return GestureDetector(
                        onTap: () => Get.toNamed(Routes.DETAILS_PRODUCT,
                            arguments: listAllDocs[index].id),
                        child: WidgetHistory(
                          image:
                              "${(listAllDocs[index].data() as Map<String, dynamic>)['gambar']}",
                          itemName:
                              "${(listAllDocs[index].data() as Map<String, dynamic>)['nama_barang']}",
                          ingredient:
                              "${(listAllDocs[index].data() as Map<String, dynamic>)['jenis_bahan']}",
                          dateTime: "${(listAllDocs[index].data() as Map<String, dynamic>)['tanggal_masuk']}",
                          status: "Masuk",
                          colors: MyColors.cardOne,                        
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),       
          ],
        ),
      ),
    );
  }
}
