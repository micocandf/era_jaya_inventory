import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../global/colors_assets.dart';

Widget WidgetBanner({total_barang, barang_masuk, barang_keluar}) {
  return Stack(
    // alignment: Alignment.center,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        child: Container(
          height: 200,
          width: double.infinity,
          color: MyColors.mainColor,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 27),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Text("Era Jaya Mebel Inventory",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 80,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text('Total Barang',
                                  style: GoogleFonts.inter(
                                      fontSize: 13, color: MyColors.greyText)),
                              SizedBox(height: 3),
                              Text(
                                '100',
                                style: GoogleFonts.inter(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.blackText),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: MyColors.greyText,
                            thickness: 1,
                          ),
                          Column(
                            children: [
                              Text('Barang Masuk',
                                  style: GoogleFonts.inter(
                                      fontSize: 13, color: MyColors.greyText)),
                              SizedBox(height: 3),
                              Text('100',
                                  style: GoogleFonts.inter(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.blackText)),
                            ],
                          ),
                          VerticalDivider(
                            color: MyColors.greyText,
                            thickness: 1,
                          ),
                          Column(
                            children: [
                              Text('Barang Keluar',
                                  style: GoogleFonts.inter(
                                      fontSize: 13, color: MyColors.greyText)),
                              SizedBox(height: 3),
                              Text('31',
                                  style: GoogleFonts.inter(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.blackText)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Card(
              elevation: 2.5,
              shadowColor: Colors.black45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 44,
                  color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Text("Pencarian...", style: GoogleFonts.inter(fontSize: 13, color: MyColors.greyText)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
