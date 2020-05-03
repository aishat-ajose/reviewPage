import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';

class StatisticsChart extends StatefulWidget {
  @override
  _StatisticsChartState createState() => _StatisticsChartState();
}

class _StatisticsChartState extends State<StatisticsChart> {
  final fromDate = DateTime(2020, 01, 29);

  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));
  final date3 = DateTime.now().subtract(Duration(days: 4));
  final date4 = DateTime.now().subtract(Duration(days: 5));
  final date5 = DateTime.now().subtract(Duration(days: 6));
  final date6 = DateTime.now().subtract(Duration(days: 7));

  final date7 = DateTime.now().subtract(Duration(days: 2));
  final date8 = DateTime.now().subtract(Duration(days: 3));

  final date9 = DateTime.now().subtract(Duration(days: 35));
  final date10 = DateTime.now().subtract(Duration(days: 36));

  final date11 = DateTime.now().subtract(Duration(days: 65));
  final date12 = DateTime.now().subtract(Duration(days: 64));

  String _selected = "Weekly";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0.0, 1.0)
          )
        ],
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(  
            padding: const EdgeInsets.only(top:10.0, left:20.0, right: 20.0),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Statistical Overview", style: TextStyle(fontWeight: FontWeight.bold),),
                DropdownButton<String>(
                  value: _selected,
                  items: <String>['Weekly', 'Monthly'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selected = newValue;
                    });
                  },
                )
              ],
            ),
          ),
          chart()
        ],
      )
    );
  }

  Widget chart(){
    return _selected == "Weekly" ?
      Container(
        height: 100,
        child: BezierChart(
          fromDate: fromDate,
          bezierChartScale: BezierChartScale.WEEKLY,
          toDate: toDate,
          series: [
            BezierLine(
              label: "Views",
              lineColor: Colors.purple,
              onMissingValue: (dateTime){
                if (dateTime.day.isEven) {
                  return 10.0;
                }
                return 5.0;
              },
              data: [
                DataPoint<DateTime>(value: 30, xAxis: date1),
                DataPoint<DateTime>(value: 50, xAxis: date2),
                DataPoint<DateTime>(value: 30, xAxis: date3),
                DataPoint<DateTime>(value: 80, xAxis: date4),
                DataPoint<DateTime>(value: 40, xAxis: date5),
                DataPoint<DateTime>(value: 70, xAxis: date6),
              ]
            ),
            BezierLine(
              label: "Orders",
              lineColor: Colors.red,
              onMissingValue: (dateTime){
                if (dateTime.day.isEven) {
                  return 15.0;
                }
                return 10.0;
              },
              data: [
                DataPoint<DateTime>(value: 15, xAxis: date1),
                DataPoint<DateTime>(value: 35, xAxis: date2),
                DataPoint<DateTime>(value: 10, xAxis: date3),
                DataPoint<DateTime>(value: 50, xAxis: date4),
                DataPoint<DateTime>(value: 30, xAxis: date5),
                DataPoint<DateTime>(value: 50, xAxis: date6),
              ]
            ),
          ],
          config: BezierChartConfig(
            verticalIndicatorStrokeWidth: 3.0,
            verticalIndicatorColor: Colors.black26,
            showVerticalIndicator: true,
            verticalIndicatorFixedPosition: false,
            backgroundColor: Colors.blue[100],
            footerHeight: 50.0,
            
          ),
        ),
      ):
    Container(
      height: 100,
      child: BezierChart(
        fromDate: fromDate,
        bezierChartScale: BezierChartScale.MONTHLY,
        toDate: toDate,
        series: [
          BezierLine(
            label: "Views",
            lineColor: Colors.purple,
            onMissingValue: (dateTime){
              if (dateTime.day.isEven) {
                return 10.0;
              }
              return 5.0;
            },
            data: [
              DataPoint<DateTime>(value: 60, xAxis: date1),
              DataPoint<DateTime>(value: 50, xAxis: date2),
              DataPoint<DateTime>(value: 30, xAxis: date3),
              DataPoint<DateTime>(value: 80, xAxis: date4),
              DataPoint<DateTime>(value: 40, xAxis: date5),
              DataPoint<DateTime>(value: 70, xAxis: date6),
            ]
          ),
          BezierLine(
            label: "Orders",
            lineColor: Colors.red,
            onMissingValue: (dateTime){
              if (dateTime.day.isEven) {
                return 15.0;
              }
              return 10.0;
            },
            data: [
              DataPoint<DateTime>(value: 75, xAxis: date1),
              DataPoint<DateTime>(value: 35, xAxis: date2),
              DataPoint<DateTime>(value: 90, xAxis: date3),
              DataPoint<DateTime>(value: 50, xAxis: date4),
              DataPoint<DateTime>(value: 30, xAxis: date5),
              DataPoint<DateTime>(value: 20, xAxis: date6),
            ]
          ),
        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 3.0,
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: true,
          verticalIndicatorFixedPosition: false,
          backgroundColor: Colors.blue[100],
          footerHeight: 50.0,
          
        ),
      ),
    );
        
  }
}