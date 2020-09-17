import 'dart:async';

import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class Solution extends StatefulWidget {
  @override
  _SolutionState createState() => _SolutionState();
}

class _SolutionState extends State<Solution> {

  int _actualPageNumber = 1, _allPagesCount = 0;
  bool isSampleDoc = true;
  PdfController _pdfController;

  @override
  void initState() {
    _pdfController = PdfController(
      document: PdfDocument.openAsset('assets/solutions/0.pdf'),
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE62A6E),
        title: Text(
          "Solution"
        ),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: PdfView(
          documentLoader: Center(child: CircularProgressIndicator()),
          pageLoader: Center(child: CircularProgressIndicator()),
          controller: _pdfController,
          onDocumentLoaded: (document) {
            setState(() {
              _actualPageNumber = 1;
              _allPagesCount = document.pagesCount;
            });
          },
          onPageChanged: (page) {
            setState(() {
              _actualPageNumber = page;
            });
          },
        ),
      ),
    );
  }
}
