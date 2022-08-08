import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/colors_assets.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../../product_page_lemari/views/widgets/productItem.dart';
import '../controllers/product_page_buffet_controller.dart';

class ProductPageBuffetView extends GetView<ProductPageBuffetController> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Barang",
          style: GoogleFonts.inter(fontSize: 15, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: MyColors.greyText),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streammData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data!.docs;
            return GridView.builder(
              // physics: NeverScrollableScrollPhysics(),
              // scrollDirection: Axis.vertical,
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) {
                if ((listAllDocs[index].data() as Map<String, dynamic>) ['kategori'] == 'Buffet') {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAILS_PRODUCT,
                        arguments: listAllDocs[index].id,
                      );
                    },
                    child: productItem(
                      image:
                          "${(listAllDocs[index].data() as Map<String, dynamic>)['gambar']}",
                      name:
                          "${(listAllDocs[index].data() as Map<String, dynamic>)['nama_barang']}",
                      dateOne:
                          "${(listAllDocs[index].data() as Map<String, dynamic>)['tanggal_masuk']}",
                      dateTwo:
                          "${(listAllDocs[index].data() as Map<String, dynamic>)['tanggal_keluar']}",
                      itemCount:
                          "${(listAllDocs[index].data() as Map<String, dynamic>)['quantity']}",
                    ),
                  );
                } else {
                  return Container();
                }
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blueGrey,
        onTap: homeController.changeTabIndex,
        currentIndex: homeController.tabIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 1,
        items: [
          _bottomNavigationBarItem(
            icon: CupertinoIcons.home,
            label: 'Home',
            color: MyColors.greyText,
            size: 27,
          ),
          _bottomNavigationBarItem(
            icon: CupertinoIcons.time,
            label: 'History',
            color: MyColors.greyText,
            size: 27,
          ),
          _bottomNavigationBarItem(
            icon: Icons.add_box_rounded,
            label: 'Add',
            color: MyColors.mainColor,
            size: 35,
          ),
          _bottomNavigationBarItem(
            icon: CupertinoIcons.list_bullet,
            label: 'List',
            color: MyColors.greyText,
            size: 27,
          ),
          _bottomNavigationBarItem(
            icon: CupertinoIcons.settings,
            label: 'Settings',
            color: MyColors.greyText,
            size: 27,
          ),
        ],
        selectedItemColor: MyColors.mainColor,
      ),
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
