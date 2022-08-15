
import 'dart:io';
import 'dart:typed_data';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController namaBarangC;
  late TextEditingController merkC;
  late TextEditingController kodeBarangC;
  late TextEditingController quantityC;
  // late TextEditingController gambarC;

  var tabIndex = 0;
  final count = 0.obs;

  var kategoriName = ''.obs;
  var jenisBahan = ''.obs;
  var kondisi = ''.obs;
  var gambar = ''.obs;

  var lemari =
      "https://res.cloudinary.com/ruparupa-com/image/upload//f_auto,q_auto:eco/v1548400980/Products/10203341_1.jpg"
          .obs;
  var meja =
      "https://d2xjmi1k71iy2m.cloudfront.net/dairyfarm/id/images/370/0737092_PE740877_S5.jpg"
          .obs;
  var kursi =
      "http://static.bmdstatic.com/pk/product/large/60408ebf92be5.jpg".obs;
  var kasur =
      "https://images.tokopedia.net/img/cache/700/product-1/2019/7/22/40546053/40546053_c62bac1b-1399-4ae5-8c88-cc7061f426e9_380_380"
          .obs;
  var rak =
      "https://www.atria.co.id/wp-content/uploads/2021/07/22004429-WIRE-SHELF-3TIERS-30KG500X300X760-BLACK-COATED-12.jpg"
          .obs;
  var buffet =
      "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/super_super-511-sliding-buffet-tv---oak_full02.jpg"
          .obs;

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

  final List<String> gambarItems = [
    'Lemari',
    'Kursi',
    'Meja',
    'Kasur',
    'Rak',
    'Buffet'
  ];


  @override
  void onInit() {
    kategoriName;
    jenisBahan;
    kondisi;
    gambar;
    namaBarangC = TextEditingController();
    quantityC = TextEditingController();
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

  void getPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          );
        },
      ),
    );

    Uint8List bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/mydocument.pdf');

    await file.writeAsBytes(bytes);

    await OpenFile.open(file.path);
  }

}
