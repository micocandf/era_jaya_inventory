import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductPageKasurController extends GetxController {
  //TODO: Implement ProductPageKasurController

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

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference productsByCategory =
        FirebaseFirestore.instance.collection('products');
    // return productsByCategory.where("kategori", isEqualTo: "Kasur").snapshots();
    return productsByCategory.where("kategori", isEqualTo: "Kasur").snapshots();
  } 
}
  