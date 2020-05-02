import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0.0, 1.0)
          )
        ],
        borderRadius: BorderRadius.circular(10)
      ),
      
      child: Column(
        children: <Widget>[
          Text("Statistic Overview"),
          SizedBox(height: 10.0,),
          Container(
            height: 120.0,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(), // Initialize category axis.
            series: <LineSeries<SalesData, String>>[ // Initialize line series.
              LineSeries<SalesData, String>(
                dataSource: [
                  SalesData('Jan', 35),
                  SalesData('Feb', 28),
                  SalesData('Mar', 44),
                  SalesData('Apr', 32),
                  SalesData('May', 40)
                ],
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales
              )
              ]
            ),
          ),
        ],

      ),
      
    );
  }
}
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}