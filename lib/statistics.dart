import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';

class StatisticsChart extends StatefulWidget {
  final List<List<double>> weeklyOrdersVsView;
  final List<List<double>> monthlyOrdersVsView;
  StatisticsChart({this.weeklyOrdersVsView,this.monthlyOrdersVsView});

  @override
  _StatisticsChartState createState() => _StatisticsChartState();
}

class _StatisticsChartState extends State<StatisticsChart> {
  final weeeklyfromDate = DateTime.now().subtract(Duration(days: 7));
  final monthlyfromDate = DateTime(2020, 01, 01);

  final toDate = DateTime.now();

  final date0 = DateTime.now().subtract(Duration(days: 1));
  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));
  final date3 = DateTime.now().subtract(Duration(days: 4));
  final date4 = DateTime.now().subtract(Duration(days: 5));
  final date5 = DateTime.now().subtract(Duration(days: 6));
  final date6 = DateTime.now().subtract(Duration(days: 7));

  final month1 = DateTime.now().subtract(Duration(days: 30));
  final month2 = DateTime.now().subtract(Duration(days: 60));
  final month3 = DateTime.now().subtract(Duration(days: 90));

  String _selected = "Weekly";

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  elevation: 24,
                  underline:Container(
                      height: 1.0,
                      decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0))
                      ),
                    ),
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
    // Weekly Statistics
      Container(
        height:  MediaQuery.of(context).size.height/3,
        child: BezierChart(
          fromDate: weeeklyfromDate,
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
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[0][0], xAxis: date0),
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[1][0], xAxis: date1),
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[2][0], xAxis: date2),
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[3][0], xAxis: date3),
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[4][0], xAxis: date4),
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[5][0], xAxis: date5),
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[6][0], xAxis: date6),
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
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[0][1], xAxis: date0),
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[1][1], xAxis: date1),
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[2][1], xAxis: date2),
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[3][1], xAxis: date3),
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[4][1], xAxis: date4),
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[5][1], xAxis: date5),
                DataPoint<DateTime>(value: widget.weeklyOrdersVsView[6][1], xAxis: date6),
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

    // Monthly Statistics
    Container(
      height:  MediaQuery.of(context).size.height/3,
      child: BezierChart(
        fromDate: monthlyfromDate,
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
                DataPoint<DateTime>(value: widget.monthlyOrdersVsView[0][0], xAxis: date1),
                DataPoint<DateTime>(value: widget.monthlyOrdersVsView[1][0], xAxis: month1),
                DataPoint<DateTime>(value: widget.monthlyOrdersVsView[2][0], xAxis: month2),
                DataPoint<DateTime>(value: widget.monthlyOrdersVsView[3][0], xAxis: month3),
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
              DataPoint<DateTime>(value: widget.monthlyOrdersVsView[0][1], xAxis: date1),
              DataPoint<DateTime>(value: widget.monthlyOrdersVsView[1][1], xAxis: month1),
              DataPoint<DateTime>(value: widget.monthlyOrdersVsView[2][1], xAxis: month2),
              DataPoint<DateTime>(value: widget.monthlyOrdersVsView[3][1], xAxis: month3),
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