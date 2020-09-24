import 'package:coding_dojo_app/globalvars.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class LineChartSample2 extends StatefulWidget {
  String chap_name;
  LineChartSample2({Key key, this.chap_name}): super(key: key);

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
//    const Color(0xff23b6e6),
//    const Color(0xff02d39a),
    const Color(0xFFE62A6E),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          // width: 370,
          width: double.infinity,
          height: 220,
          decoration: const BoxDecoration(
//              borderRadius: BorderRadius.all(
//                Radius.circular(18),
//              ),
            //color: Color(0xff232d37),
            color: Color(0xFF18214C),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                right: 18.0, left: 12.0, top: 24, bottom: 12),
            child: LineChart(
              mainData(widget.chap_name),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: FlatButton(
            onPressed: () {

            },
            child: Text(
              'Time (sec)',
              style: TextStyle(
                  fontSize: 12,
                  color: showAvg ? Colors.white.withOpacity(0.5) : Colors
                      .white),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData(String chap_name) {
    var counter=0;
    var qlist=[];//a list that stores all info for this particular chapter
    print(chap_name);
    int k=0;
    for(int i=0;i< GlobalVariables.questionslist.length;i++){
      if(GlobalVariables.questionslist[i][0]==chap_name){
        qlist.add(GlobalVariables.questionslist[i]);
        // qlist[k].add(i);
        //print(GlobalVariables.questionslist[i]);
        //print(qlist);
        // k++;
      }
    }

    double _maxY=0;
    for(var i=0;i<qlist.length;i++) {
      if( _maxY < qlist[i][6]){
        _maxY=qlist[i][6];
      }
    }
    _maxY+=100;
    print("maxY="+_maxY.toString());

    int _maxX=0;
    for(var i=0;i<qlist.length;i++) {
      if( qlist[i][5]==1){
        //mhanje question cha completion status 1 astil tar titke questions dakhavle zaatil
        _maxX=i+1;
      }
    }
    if(_maxX<3){
      _maxX=2;
    }
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle:
          const TextStyle(color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 8.5),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'Q1';
              case 1:
                return 'Q2';
              case 2:
                return 'Q3';
              case 3:
                return 'Q4';
              case 4:
                return 'Q5';
              case 5:
                return 'Q6';
              case 6:
                return 'Q7';
              case 7:
                return 'Q8';
              case 8:
                return 'Q9';
              case 9:
                return 'Q10';
              case 10:
                return 'Q11';
              case 11:
                return 'Q12';
              case 12:
                return 'Q13';
              case 13:
                return 'Q14';
              case 14:
                return 'Q15';
              case 15:
                return 'Q16';
              case 16:
                return 'Q17';
              case 17:
                return 'Q18';
              case 18:
                return 'Q19';
              case 19:
                return 'Q20';
              case 20:
                return 'Q21';
              case 21:
                return 'Q22';
              case 22:
                return 'Q23';
              case 23:
                return 'Q24';
              case 24:
                return 'Q25';
              case 25:
                return 'Q26';
              case 26:
                return 'Q27';
              case 27:
                return 'Q28';
              case 28:
                return 'Q29';
              case 29:
                return 'Q30';
              case 30:
                return 'Q31';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              /*case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';*/
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: _maxX.toDouble(),
      minY: 0,
      maxY: _maxY,
      lineBarsData: [
        LineChartBarData(
          spots: qlist.map((i){
            //print(counter);
            var prevX=0.0;
            var prevY=0.0;
            //if(counter<=_maxX){
              counter+=1;
              //print(i[6]);
              prevX=counter.toDouble()-1;
              prevY=i[6];
              return FlSpot(counter.toDouble()-1, i[6]);
            /*}
            else{
              return FlSpot(prevX,prevY);
            }*/
          }).toList(),
          /*spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1)
          ],*/
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3))
                .toList(),
          ),
        ),
      ],
    );
  }
}