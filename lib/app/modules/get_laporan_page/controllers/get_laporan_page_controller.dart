import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GetLaporanPageController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final format = DateFormat("yyyy-MM-dd");
  final startDate = Timestamp.fromDate(DateTime.now());
  final endDate = Timestamp.fromDate(
    DateTime.now().subtract(const Duration(days: 1)),
  );

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

  // Future<QuerySnapshot<Map<String, dynamic>>> getData(String? docID) async {
  //   DocumentReference docRef = firestore.collection('products').where('tanggal_masuk', isLessThan: startDate, isGreaterThan: endDate);
  //   return docRef.get();
  // }

  Future<QuerySnapshot<Map<String, dynamic>>> getRecentDocs() async {

  final Timestamp now = Timestamp.fromDate(DateTime.now());
  final Timestamp yesterday = Timestamp.fromDate(
    DateTime.now().subtract(const Duration(days: 1)),
  );

  final query = FirebaseFirestore.instance
      .collection('collectionPath')
      .where('createdAt', isLessThan: now, isGreaterThan: yesterday);

  return query.get();
}
}