import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:era_jaya_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/colors_assets.dart';
import '../controllers/get_laporan_page_controller.dart';

class GetLaporanPageView extends GetView<GetLaporanPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Laporan",
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
      body: Column(
        children: [
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 180,
                child: DateTimeField(
                  format: controller.format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.date_range),
                    labelText: "Tanggal Mulai Masuk",
                    labelStyle: GoogleFonts.inter(
                      fontSize: 10,
                      color: MyColors.greyText,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 180,
                child: DateTimeField(
                  format: controller.format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.date_range),
                    labelText: "Tanggal Akhir Masuk",
                    labelStyle: GoogleFonts.inter(
                      fontSize: 10,
                      color: MyColors.greyText,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 180,
                child: DateTimeField(
                  format: controller.format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.date_range),
                    labelText: "Tanggal Mulai Retur",
                    labelStyle: GoogleFonts.inter(
                      fontSize: 10,
                      color: MyColors.greyText,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 180,
                child: DateTimeField(
                  format: controller.format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.date_range),
                    labelText: "Tanggal Akhir Retur",
                    labelStyle: GoogleFonts.inter(
                      fontSize: 10,
                      color: MyColors.greyText,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              print(context);
              Get.toNamed(Routes.REPORT_PDF);
            },
            child: Card(
              elevation: 5,
              shadowColor: Colors.black45,
              child: Container(
                height: 50,
                width: 160,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.newspaper, color: MyColors.mainColor, size: 30),
                    SizedBox(width: 5),
                    Text(
                      'Laporan',
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: MyColors.greyText),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
