import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Untuk mengambil id
  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('products').doc(docID);
    return docRef.get();
  }

  void deleteData(String docId) async {
    DocumentReference docRef = firestore.collection('products').doc(docId);
    try {
      await docRef.delete();
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Data berhasil dihapus",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    } catch (e) {
      print(e.toString());
      Get.defaultDialog(
        title: "Gagal",
        middleText: "Data gagal dihapus",
      );
    }
  }
}
