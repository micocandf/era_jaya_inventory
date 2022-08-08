import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../global/colors_assets.dart';

Widget cardItemOne(
    {name,
    image,
    entryDate,
    returDate,
    kodeBarang,
    condition,
    rawMaterial,    
    quantity}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Center(
          child: Card(
            child: Container(
              height: 200,
              width: 380,
              child: Column(
                children: [
                  SizedBox(
                      height: 150, width: 150, child: Image.network(image)),
                  Text(
                    name,
                    style: GoogleFonts.inter(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Card(
        child: Container(
          height: 100,
          width: 380,
          child: Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Tanggal Masuk Barang: ",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greenText,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      entryDate,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greenText,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      "Tanggal Retur: ",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greenText,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      returDate,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greenText,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      Card(
        child: Container(
          height: 150,
          width: 380,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0
            , bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Rincian Produk",
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      color: MyColors.greyText,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Divider(
                        color: MyColors.greyText,
                        height: 20,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Kode Barang",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 24),
                    Text(
                      ":   ",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      kodeBarang,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Stok",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 80),
                    Text(
                      ":   ",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      quantity,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Kondisi",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 61),
                    Text(
                      ":   ",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      condition,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Jenis Bahan",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 28.9),
                    Text(
                      ":   ",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      rawMaterial,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),                
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
