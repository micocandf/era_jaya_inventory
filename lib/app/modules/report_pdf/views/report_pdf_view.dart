import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_pdf_controller.dart';

class ReportPdfView extends GetView<ReportPdfController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReportPdfView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReportPdfView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
