import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pdfviewer_controller.dart';

class PdfviewerView extends GetView<PdfviewerController> {
  const PdfviewerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PdfviewerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PdfviewerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
