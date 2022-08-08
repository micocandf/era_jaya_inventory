import 'package:era_jaya_inventory/app/global/colors_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget productItem({image, name, dateOne, dateTwo, itemCount}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      elevation: 5,
      shadowColor: Colors.black45,
      child: Container(
        height: 170,
        width: 180,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 110,
                width: 110,
                child: Image.network(image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                name,
                style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: MyColors.greyText),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    "",
                    style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: MyColors.greyText),
                  ),
                  Text(
                    dateOne,
                    style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: MyColors.greyText),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Tanggal Retur: ",
                        style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: MyColors.greyText),
                      ),
                      Text(
                        dateTwo,
                        style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: MyColors.greyText),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    itemCount,
                    style: GoogleFonts.inter(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: MyColors.greenText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
