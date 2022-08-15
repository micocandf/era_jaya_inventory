import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:era_jaya_inventory/app/global/colors_assets.dart';
import 'package:era_jaya_inventory/app/modules/home/views/widgets/addItemPage/form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/home_controller.dart';

class addItemPage extends GetView<HomeController> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Tambah Product",
          style: GoogleFonts.inter(fontSize: 15, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              formField(
                  icon: Icon(Icons.all_inbox_outlined),
                  name: "Nama Barang",
                  textInputAct: TextInputAction.next,
                  controller: controller.namaBarangC),
              SizedBox(height: 13),
              formField(
                  icon: Icon(Icons.label),
                  name: "Quantity",
                  textInputAct: TextInputAction.next,
                  controller: controller.quantityC),
              SizedBox(height: 13),
              formField(
                  icon: Icon(Icons.qr_code),
                  name: "Kode Barang",                  
                  textInputAct: TextInputAction.next,
                  controller: controller.kodeBarangC),
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
                  controller.addProduct(
                      controller.kategoriName.value,
                      controller.jenisBahan.value,
                      controller.kondisi.value,
                      controller.namaBarangC.text,
                      controller.quantityC.text,
                      controller.kodeBarangC.text,                      
                      controller.gambar.value);
                },
                child: Text(' Save '),
              )
            ],
          ),
        ),
      ),
    );
  }
}