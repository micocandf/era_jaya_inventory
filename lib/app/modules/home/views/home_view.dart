import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:era_jaya_inventory/app/global/colors_assets.dart';
import 'package:era_jaya_inventory/app/modules/home/views/pages/add_item_page.dart';
import 'package:era_jaya_inventory/app/modules/home/views/pages/history_page.dart';
import 'package:era_jaya_inventory/app/modules/home/views/pages/list_page.dart';
import 'package:era_jaya_inventory/app/modules/home/views/pages/settings_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'pages/home_page.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                homePage(),
                historyPage(),
                addItemPage(),
                listPage(),
                settingsPage(),              
              ],
            ),            
          ),
          extendBody: false,
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: DotNavigationBar(
              margin: EdgeInsets.only(left: 10, right: 10),
              currentIndex: controller.tabIndex,
              dotIndicatorColor: Colors.white,
              unselectedItemColor: Colors.grey[300],              
              enableFloatingNavBar: false,
              onTap: controller.changeTabIndex,
              enablePaddingAnimation: true,
              selectedItemColor: MyColors.mainColor,            
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
              items: [
                // Home Page
                DotNavigationBarItem(
                  icon: Icon(Icons.home),                 
                ),

                // History Page
                DotNavigationBarItem(
                  icon: Icon(Icons.timelapse),                  
                ),

                // Add Page
                DotNavigationBarItem(
                  icon: Icon(Icons.add_box_rounded, size: 35),                  
                  unselectedColor: MyColors.mainColor,                  
                ),

                // List Page
                DotNavigationBarItem(
                  icon: Icon(Icons.list_alt),                  
                ),

                //Setting Page
                DotNavigationBarItem(
                  icon: Icon(Icons.settings),                  
                ),
              ],
            ),
          ),        
        );
      },
    );
  }

  _bottomNavigationBarItem(
      {IconData? icon, required String? label, color, required double? size}) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: color, size: size),
      label: label,
    );
  }
}
