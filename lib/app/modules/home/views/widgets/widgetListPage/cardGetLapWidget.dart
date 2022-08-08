import 'package:era_jaya_inventory/app/global/colors_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cardGetLapWidget({color, icon, name}) {
  return Stack(
    children: [
      Center(
        child: Card(
          elevation: 5,
          shadowColor: Colors.black45,
          child: Container(
            height: 50,
            width: 340,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 75,
                  width: 5,
                  color: color,
                ),
                SizedBox(width: 25),
                Row(                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon,color: MyColors.mainColor,size: 30),
                    SizedBox(width: 5),
                    Text(name,
                        style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: MyColors.greyText)),
                  ],
                ),
                SizedBox(width: 75),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
