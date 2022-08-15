import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/colors_assets.dart';
import '../controllers/edit_product_controller.dart';

class EditProductView extends GetView<EditProductController> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: MyColors.greyText),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Edit Product",
          style: GoogleFonts.inter(fontSize: 15, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.data() as Map<String, dynamic>;
              controller.kategoriName.value = data["kategori"];
              controller.jenisBahan.value = data["jenis_bahan"];
              controller.kondisi.value = data["kondisi"];
              controller.namaBarangC.text = data["nama_barang"];
              controller.kodeBarangC.text = data["kode_barang"];
              controller.gambar.value = data["gambar"];
              controller.quantityC.text = data["quantity"];

              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        icon: Icon(Icons.category),
                        //Add isDense true and zero Padding.
                        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        //Add more decoration as you want here
                        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Kategori',
                        style: TextStyle(fontSize: 14),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 45,
                      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      items: controller.kategoriItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Pilih Kategori.';
                        }
                      },
                      onChanged: (value) {
                        selectedValue = value as String?;
                        controller.kategoriName.value = value!;
                        //Do something when changing the item if you want.
                      },
                      onSaved: (value) {
                        // selectedValue = value;
                        selectedValue = value as String?;
                        controller.kategoriName.value = value!;
                      },
                    ),
                    SizedBox(height: 13),
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        icon: Icon(Icons.margin),
                        //Add isDense true and zero Padding.
                        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        //Add more decoration as you want here
                        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Jenis Bahan',
                        style: TextStyle(fontSize: 14),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 45,
                      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      items: controller.jenisBahanItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Pilih Jenis Bahan.';
                        }
                      },
                      onChanged: (value) {
                        selectedValue = value as String?;
                        controller.jenisBahan.value = value!;
                        //Do something when changing the item if you want.
                      },
                      onSaved: (value) {
                        // selectedValue = value;
                        selectedValue = value as String?;
                        controller.jenisBahan.value = value!;
                      },
                    ),
                    SizedBox(height: 13),                    
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        icon: Icon(Icons.control_point_duplicate_outlined),
                        //Add isDense true and zero Padding.
                        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        //Add more decoration as you want here
                        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Kondisi',
                        style: TextStyle(fontSize: 14),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 45,
                      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      items: controller.kondisiItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Pilih Kondisi Barang.';
                        }
                      },
                      onChanged: (value) {
                        selectedValue = value as String?;
                        controller.kondisi.value = value!;
                        //Do something when changing the item if you want.
                      },
                      onSaved: (value) {
                        // selectedValue = value;
                        selectedValue = value as String?;
                        controller.kondisi.value = value!;
                      },
                    ),
                    SizedBox(height: 13),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: controller.namaBarangC,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          icon: Icon(Icons.all_inbox_outlined),
                          labelText: "Nama Barang",
                          labelStyle: GoogleFonts.inter(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 13),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: controller.quantityC,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          icon: Icon(Icons.countertops_outlined),
                          labelText: "Quantity",
                          labelStyle: GoogleFonts.inter(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 13),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: controller.kodeBarangC,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          icon: Icon(Icons.qr_code),
                          labelText: "Kode Barang",
                          labelStyle: GoogleFonts.inter(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 13),
                    DropdownButtonFormField2(
                decoration: InputDecoration(
                  icon: Icon(Icons.image),                 
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),                  
                ),
                isExpanded: true,
                hint: const Text(
                  'Gambar',
                  style: TextStyle(fontSize: 14),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 45,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                items: controller.gambarItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Pilih Gambar.';
                  }
                },
                onChanged: (value) {
                  selectedValue = value as String?;
                  controller.gambar.value = value!;
                  //Do something when changing the item if you want.
                },
                onSaved: (value) {
                  // selectedValue = value;
                  selectedValue = value as String?;
                  controller.gambar.value = value!;
                },
              ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: MyColors.mainColor, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        controller.editProduct(
                            controller.kategoriName.value,
                            controller.jenisBahan.value,
                            controller.kondisi.value,
                            controller.namaBarangC.text,
                            controller.quantityC.text,
                            controller.kodeBarangC.text,
                            controller.gambar.value,
                            Get.arguments);
                      },
                      child: Text(' Save '),
                    )
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}