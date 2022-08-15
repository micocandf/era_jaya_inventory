import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:era_jaya_inventory/app/global/colors_assets.dart';
import 'package:era_jaya_inventory/app/modules/home/views/widgets/widgetListPage/cardGetLapWidget.dart';
import 'package:era_jaya_inventory/app/modules/home/views/widgets/widgetListPage/cardWidget.dart';
import 'package:era_jaya_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/home_controller.dart';

class listPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Daftar Barang",
            style: GoogleFonts.inter(fontSize: 15, color: Colors.black)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Hari Ini",
                    style: GoogleFonts.inter(
                        fontSize: 15, color: MyColors.mainText)),
                Text("Minggu",
                    style: GoogleFonts.inter(
                        fontSize: 15, color: MyColors.greyText)),
                Text("Bulan",
                    style: GoogleFonts.inter(
                        fontSize: 15, color: MyColors.greyText)),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<QuerySnapshot<Object?>>(
                  stream: controller.streamData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var listDocs = snapshot.data!.docs;
                      return cardWidget(
                        color: MyColors.mainColor,
                        number: "${snapshot.data!.docs.length}",
                        name: "Total Barang",
                      );
                    } else {
                      return Text("");
                    }
                  },
                ),
                SizedBox(width: 10),
                cardWidget(
                    color: MyColors.cardOrange,
                    number: "200",
                    name: "Total Barang Kembali"),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<QuerySnapshot<Object?>>(
                  stream: controller.streamData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var listDocs = snapshot.data!.docs;
                      return cardWidget(
                        color: MyColors.cardGreen,
                        number: "${snapshot.data!.docs.length}",
                        name: "Total Barang Masuk",
                      );
                    } else {
                      return Text("");
                    }
                  },
                ),
                SizedBox(width: 10),
                cardWidget(
                    color: MyColors.cardRed,
                    number: "200",
                    name: "Total Barang Terjual"),
              ],
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                controller.getPDF();
              },
              child: cardGetLapWidget(
                  color: MyColors.cardPurple,
                  name: "Laporan",
                  icon: Icons.newspaper),
            ),
          ],
        ),
      ),
    );
  }
}
