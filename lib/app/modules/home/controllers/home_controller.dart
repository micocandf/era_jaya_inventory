import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController namaBarangC;
  late TextEditingController merkC;
  late TextEditingController kodeBarangC;
  late TextEditingController quantityC;
  late TextEditingController gambarC;

  var tabIndex = 0;
  final count = 0.obs;

  var kategoriName = ''.obs;
  var jenisBahan = ''.obs;
  var kondisi = ''.obs;
  final List<String> kategoriItems = [
    'Lemari',
    'Meja',
    'Kursi',
    'Kasur',
    'Rak',
    'Buffet',
  ];

  final List<String> jenisBahanItems = [
    'Baja',
    'Kayu',
    'Besi',
    'Plastik',
    'Kaca',
    'Marmer',
    'Partikel',
    'Jati',
    'Rebounded',
    'Busa',
  ];

  final List<String> kondisiItems = [
    'Diterima',
    'Retur',
  ];

  @override
  void onInit() {
    kategoriName;
    jenisBahan;
    kondisi;
    namaBarangC = TextEditingController();
    quantityC = TextEditingController();
    gambarC = TextEditingController();
    kodeBarangC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    kategoriName;
    jenisBahan;
    kondisi;
    namaBarangC.dispose();
    quantityC.dispose();
    kodeBarangC.dispose();
    gambarC.dispose();

    super.onClose();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  // Untuk menambahkan produk

  void addProduct(
      String kategoriName, // Ini tu parameter untuk kategori
      String jenisBahan,
      String kondisi,
      String namaBarang,
      String quantity,
      String kodeBarang,
      String gambar) async {
    CollectionReference products = FirebaseFirestore.instance.collection(
        'products'); // Ini untuk mengambil data dari collection products

    try {
      DateTime now = DateTime.now();
      String dateNow = DateFormat.yMMMMd().add_jm().format(now);
      await products.add(
        {
          'kategori': kategoriName,
          'jenis_bahan': jenisBahan,
          'kondisi': kondisi,
          'nama_barang': namaBarang,
          'quantity': quantity,
          'kode_barang': kodeBarang,
          'gambar': gambar,
          'tanggal_masuk': dateNow,
        },
      );

      Get.defaultDialog(
        title: 'Success',
        middleText: 'Product has been added',
        onConfirm: () {
          kategoriName;
          jenisBahan;
          kondisi;
          namaBarangC.clear();
          quantityC.clear();
          kodeBarangC.clear();
          gambarC.clear();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Error',
        middleText: 'Product cannot be added',
      );
    }
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    return products.orderBy("tanggal_masuk", descending: true).snapshots();
  }
}
