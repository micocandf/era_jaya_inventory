import 'package:era_jaya_inventory/app/global/colors_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Widget formField({icon, name, controller, textInputAct}) {
  return SizedBox(
    height: 45,
    child: TextField(
      controller: controller,
      autocorrect: false,
      textInputAction: textInputAct,
      decoration: InputDecoration(
        icon: icon,
        labelText: name,
        labelStyle: GoogleFonts.inter(fontSize: 15, color: MyColors.greyText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
