import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductPageController extends GetxController {

  static late String kategoriId;
  static var hasil;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Stream<QuerySnapshot<Object?>> streammData() {
    CollectionReference productsByCategory =
        FirebaseFirestore.instance.collection('products');
    return productsByCategory.where("kategori", isEqualTo: "Lemari").snapshots();
  }
}