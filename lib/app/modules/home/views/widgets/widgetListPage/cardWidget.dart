import 'package:era_jaya_inventory/app/global/colors_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cardWidget({color, number, name}) {
  return Stack(
    children: [
      Center(
        child: Card(
          elevation: 5,
          shadowColor: Colors.black45,
          child: Container(
            height: 75,
            width: 160,
            color: Colors.white,
            child: Row(              
              children: [
                Container(
                  height: 75,
                  width: 5,
                  color: color,
                ),
                SizedBox(width: 12),                
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [           
                    Text(number, style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold, color: MyColors.numColor)),         
                    SizedBox(height: 3.33),
                    Text(name, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: MyColors.greyText)),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
