import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/screens/manager/home_screen.dart';
class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {


  @override
  Widget build(BuildContext context) {
    Size _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: _mediaQuery.height,
          child: Container(
            height: _mediaQuery.height,
            color: appdarkColor,
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen())),
                      child: Icon(Icons.home,size: 40,color: Colors.blue,),
                    ),
                    Center(
                        widthFactor: 3.2,
                        child: Text("Analytics",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),)),

                  ],
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    color: applightColor,
                    padding: EdgeInsets.all(20),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: LineChart(
                        LineChartData(
                          borderData: FlBorderData(show: false),
                          titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 22,
                                getTextStyles: (value) =>
                                const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
                                getTitles: (value) {
                                  switch (value.toInt()) {
                                    case 2:
                                      return 'MAR';
                                    case 5:
                                      return 'JUN';
                                    case 8:
                                      return 'SEP';
                                  }
                                  return '';
                                },
                                margin: 8,
                              ),

                          ),
                          lineBarsData: [
                            LineChartBarData(
                              colors: [Colors.blue],
                                spots: [
                                  FlSpot(0, 1),
                                  FlSpot(1, 3),
                                  FlSpot(2, 10),
                                  FlSpot(3, 7),
                                  FlSpot(4, 12),
                                  FlSpot(5, 13),
                                  FlSpot(6, 17),
                                  FlSpot(7, 15),
                                  FlSpot(8, 20)
                                ]
                            )
                          ]
                      ),
                      ),
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
