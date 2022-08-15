import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var kategoriName = ''.obs;
  var jenisBahan = ''.obs;
  var kondisi = ''.obs;
  var gambar = ''.obs;

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

    final List<String> gambarItems = [
    'Lemari',
    'Kursi',
    'Meja',
    'Kasur',
    'Rak',
    'Buffet'
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
    gambar;
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
    gambar;

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
          'quantity': quantity,
          'kode_barang': kodeBarang,
          'gambar': gambar == 'Lemari' ? 'https://prodesign.id/images/products/large/lemari-pakaian-1-pintu-geser-dan-pintu-cermin-texas-4_1.png' : gambar == 'Kursi' ? 'https://padiumkm.id/public/products/27911/622794/kursi-kantor.1650509882.png' : gambar == 'Meja' ? 'https://img.my-best.id/press_component/images/53776d2c911ac39f8da59fdfc8779b63.jpg?ixlib=rails-4.2.0&q=70&lossless=0&w=690&fit=max' : gambar == 'Kasur' ? 'https://informa.co.id/files/uploads/inspirationarticle/2022/MAY/IS_collagen.jpg' : gambar == 'Rak' ? 'https://dynamic.zacdn.com/c0hC1OzzFHRo580oCEhVr8w3cfg=/fit-in/346x500/filters:quality(90):fill(ffffff)/https://static-id.zacdn.com/p/juliahie-3299-0489392-1.jpg' : gambar == 'Buffet' ? 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/super_super-511-sliding-buffet-tv---oak_full02.jpg' : '',
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
          gambar;
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