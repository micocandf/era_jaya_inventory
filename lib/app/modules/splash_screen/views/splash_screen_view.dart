import 'package:era_jaya_inventory/app/global/colors_assets.dart';
import 'package:era_jaya_inventory/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../controllers/splash_screen_controller.dart';

class splashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {

    // final homeView = Get.put(HomeView());

    return Scaffold(
      body: 
      SplashScreenView(
        navigateRoute: new HomeView(),
        duration: 3000,        
        text: "Era Jaya Inventory",
        textType: TextType.TyperAnimatedText,
        textStyle: GoogleFonts.jomhuria(fontSize: 64, fontWeight: FontWeight.w500, color: MyColors.mainText),
        backgroundColor: Colors.white,
      ),
    );
  }
}
