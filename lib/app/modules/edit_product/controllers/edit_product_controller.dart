import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var kategoriName = ''.obs;
  var jenisBahan = ''.obs;
  var kondisi = ''.obs;

  final List<String> kategoriItems = [
    'Lemari',
    'Meja',
    'Kursi',
    'Kasur',
    'Buffet',
  ];

  final List<String> jenisBahanItems = [
    'Baja',
    'Kayu',
    'Besi',
    'Plastik',
    'Kaca',
  ];

  final List<String> kondisiItems = [
    'Diterima',
    'Retur',
  ];

  late TextEditingController namaBarangC;
  late TextEditingController merkC;
  late TextEditingController kodeBarangC;
  late TextEditingController quantityC;
  late TextEditingController gambarC;

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

  // Untuk menambahkan produk

  void editProduct(
      String kategori, // Ini tu parameter untuk kategori
      String jenisBahan,
      String kondisi,
      String namaBarang,
      String quantity,
      String kodeBarang,
      String gambar,
      String? docID) async {
    DocumentReference docData = FirebaseFirestore.instance
        .collection('products')
        .doc(docID); // Ini untuk mengambil data dari collection products

    try {
      DateTime now = DateTime.now();
      String dateNow = DateFormat.yMMMMd().add_jm().format(now);
      await docData.update(
        {
          'kategori': kategori,
          'jenis_bahan': jenisBahan,
          'kondisi': kondisi,
          'nama_barang': namaBarang,
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
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Error',
        middleText: 'Product cannot be edited',
      );
    }
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    return products.snapshots();
  }

  Future<DocumentSnapshot<Object?>> getData(String? docID) async {
    DocumentReference docRef = firestore.collection('products').doc(docID);
    return docRef.get();
  }
}