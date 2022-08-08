import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/home_controller.dart';

class settingsPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(               
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Under Construction', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.black))),
        ],
      ),
    );
  }
}
