import 'package:era_jaya_inventory/app/global/colors_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget WidgetCategory({icon, name, nextPage}) {
  return Stack(
    children: [
      Center(
        child: GestureDetector(
          onTap: () {
            Get.toNamed(nextPage);
          },
          child: Card(
            elevation: 2.5,
            shadowColor: Colors.black45,
            child: Container(
              height: 70,
              width: 110,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: MyColors.greyText),
                  SizedBox(height: 3.33),
                  Text(
                    name,
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: MyColors.greyText),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
