import 'package:coding_dojo_app/chapterpage.dart';
import 'package:flutter/material.dart';
import 'package:coding_dojo_app/models/chapter_model.dart';
import 'package:google_fonts/google_fonts.dart';

class AllChapters extends StatefulWidget {
  @override
  _AllChaptersState createState() => _AllChaptersState();
}

class _AllChaptersState extends State<AllChapters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        centerTitle: true,
        title: Text(
          "HARDCORE MODE",
          style: TextStyle(
            color: Colors.grey[200],
          ),
        ),
//          backgroundColor: Color(0xFFE62A6E),
        backgroundColor: Color(0xFF18214C),
        elevation: 50.0,
        actions: <Widget>[

        ],
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
      ),*/
      body: Container(
        // color: Color(0xFFEFF0F4),
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 0, right: 0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  "FOR THE HARDCORE CODERS,",
                  style: GoogleFonts.montserrat(
                    // fontFamily: 'FreeSans',
                      fontSize: 11,
                      color: Colors.grey[600]
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Hardcore Mode",
                  style: GoogleFonts.muli(
                    // fontFamily: 'FreeSans',
                      fontSize: 33,
                      color: Colors.grey[800]
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                    scrollDirection: Axis.vertical,
                    itemCount: chapters.length,
                    itemBuilder: (BuildContext context, int index) {
                      Chapter chapter = chapters[index];
                      return Padding(
                        padding: const EdgeInsets.only( bottom: 20,left: 20, right: 20),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[500],
                                      offset: Offset(2.0, 4.5),
                                      blurRadius:7,
                                    ),
                                  ]
                              ),
                              child: FlatButton(
                                onPressed: () {
                                  /*Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: QuestionPage(chap_name: chapter.chaptername,))).then((value) {
                                              setState(() {

                                              });
                                            });*/
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => QuestionPage(chap_name: chapter.chaptername,)),
                                  ).then((value) {
                                    setState(() {

                                    });
                                  });
                                  /*setState(() {

                                            });*/
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),

                                ),

                                //color: Color(0xFFE62A6E),
                                //textColor: Colors.white,
                                color:  Colors.white,
                                textColor: Colors.black54,
                                padding: EdgeInsets.fromLTRB(10.0, 18.0, 18.0, 18.0),
                                splashColor: Color(0xFF18214C),

                                child: Row(
//                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 75.0,
                                      height: 75.0,
                                      decoration: new BoxDecoration(
                                        color: Color(0xFF18214C),
                                        borderRadius: new BorderRadius.all(new Radius.circular(65.0)),
                                        border: new Border.all(
                                          color:  Colors.white,
                                          width: 4.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          chapter.chapter_icon,
                                          height: 22,
                                          width: 22,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:215,

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  chapter.chaptername,
                                                  style: TextStyle(
                                                    fontSize: 19.0,
                                                    letterSpacing: 0.5,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                SizedBox(height: 6),
                                                Text(
                                                  chapter.noofquestions.toString()+' Questions',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            //color: Color(0xFFE62A6E),
                                            color: Colors.green,
                                            size: 28,
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                            //SizedBox(height: 10),
                          ],
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
