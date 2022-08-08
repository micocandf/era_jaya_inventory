import 'package:era_jaya_inventory/app/global/colors_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget WidgetHistory(
    {itemName, ingredient, dateTime, image, colors, status}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
    child: Card(
      elevation: 2.5,
      shadowColor: Colors.black45,
      child: Container(
        height: 110,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: Image.network(image),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(itemName,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: MyColors.blackText)),
                  SizedBox(height: 4),
                  Text(ingredient,
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: MyColors.greyText)),
                  Text(dateTime,
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: MyColors.greyText)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Container(
                    height: 20,
                    width: 80,
                    color: colors,
                    child: Center(
                        child: Text(status,
                            style: GoogleFonts.inter(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                color: MyColors.greenText))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      margin: EdgeInsets.only(bottom: 10),
    ),
  );
}
