import 'dart:async';

import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class Solution extends StatefulWidget {
  int q_id;
  Solution({Key key, this.q_id}): super(key: key);
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
      document: PdfDocument.openAsset('assets/solutions/'+widget.q_id.toString()+'.pdf'),
    );
    super.initState();
    print("q_id="+widget.q_id.toString());
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
        backgroundColor: Color(0xFF18214C),
        title: Text(
          "Solution"
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey[200],
            size: 20,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Note: The solution given doesnot handle every single error case that is for you to figure out. Here, we only present essential functionality.",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            SizedBox(
              height:MediaQuery.of(context).size.height-250,
              width: double.infinity,
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
          ],
        ),
      ),
    );
  }
}
