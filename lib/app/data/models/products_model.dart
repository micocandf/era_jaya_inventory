// import 'package:cloud_firestore/cloud_firestore.dart';

// class productsModel{
//   String? bahan;
//   String? gambar;
//   int? harga;
//   String? kategori;
//   int? kodeBarang;
//   String? merk;
//   String? modelPintu;
//   String? namaBarang;
//   String? ukuran;

//   productsModel({
//     this.bahan,
//     this.gambar,
//     this.harga,
//     this.kategori,
//     this.kodeBarang,
//     this.merk,
//     this.modelPintu,
//     this.namaBarang,
//     this.ukuran, required String jenisBahan,
//   });

//   factory productsModel.fromJson(Map<String, dynamic> json) => productsModel(
//     bahan: json["bahan"],
//     gambar: json["gambar"],
//     harga: json["harga"],
//     kategori: json["kategori"],
//     kodeBarang: json["kode_barang"],
//     merk: json["merk"],
//     modelPintu: json["model_pintu"],
//     namaBarang: json["nama_barang"],
//     ukuran: json["ukuran"],
//   );
// }