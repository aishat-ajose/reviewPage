import 'package:flutter/material.dart';
import 'package:reportpage/buildChart.dart';
import 'package:reportpage/statistics.dart';
import 'package:reportpage/trendingOrders.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue[50],
        leading: IconButton(icon: Icon(Icons.menu, color: Colors.black), onPressed: (){}),
        actions: <Widget>[
          Center(child: Text("Hi, Admin", style: TextStyle(color: Colors.black),)),
          SizedBox(width: 10.0),
          IconButton(icon: Icon(Icons.person,color: Colors.black,), onPressed: (){},)
        ],
      ),

      body: ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(20.0),
        children: <Widget>[
          // 1
          Text("Overview",
          style: TextStyle(fontWeight:FontWeight.bold,)
          ),
          // 2
          SizedBox(height: 10.0,),
          // 3
          StatisticsChart(),
          SizedBox(height: 15.0,),
          
          Container(
            height: 240.0,
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  CreateCharts(),SizedBox(width: 5.0,),
                  CreateCharts()
                ],),
                SizedBox(height: 10.0,),
                Row(children: <Widget>[
                  CreateCharts(), SizedBox(width: 5.0,),
                  CreateCharts()
                ],),
                 
              ],
            ),
          ),
          
          
          // 4
          SizedBox(height: 5.0,),
          // 5
          Text("Trending Orders",style: TextStyle(fontWeight:FontWeight.bold,)),
          // 6
          SizedBox(height: 10.0,),
          // 7
          Container(
            height:90.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
               TrendingOrders(),
               TrendingOrders(),
               TrendingOrders(),
               TrendingOrders(),
              ],
            ),
          )
        ],
      ),
    );
  }
}