import 'package:flutter/material.dart';
import 'package:reportpage/buildChart.dart';
import 'package:reportpage/statistics.dart';
import 'package:reportpage/trendingOrders.dart';
import 'package:reportpage/utils/constants.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: lightblue,

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
      padding: EdgeInsets.only(left:20.0, right: 20, bottom: 0.0, top: 10.0),
        children: <Widget>[

          Text("Overview",
          style: TextStyle(fontWeight:FontWeight.bold,)
          ),

          SizedBox(height: 10.0,),

          // This is the first chart on the app, for now it requires 7 values for each week  and 4 for the month but we can increase it.
          // both parameters take a list of list as input eg [[order1,view1],[order2,view2], ...]
          // If you prefer the input in another format, tell me.
          StatisticsChart(
            weeklyOrdersVsView: [[160,70],[90, 67],[110, 78],[150, 101],[170, 120],[77, 56],[83,45]], 
            monthlyOrdersVsView:  [[260,140],[190, 97],[190, 78],[210,134]]
          ),

          SizedBox(height: 15.0,),
          
          Container(
            height: 230,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // This takes in the number of total number of views for the resturant. and i would find a better image for it
                    CreateCharts(description:'Views', value: '109', svgPath:"assets/13.svg"),
                    SizedBox(width: 5.0,),
                    // This takes in the number of total number of Orders for the resturant. and i would find a better image for it
                    CreateCharts(description:'Orders', value: '73', svgPath:"assets/12.svg")
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: <Widget>[
                    // This takes in the number of total number of Sales for the resturant. and i would find a better image for it
                    CreateCharts(description:'Sales', value: '\$7364', svgPath: 'assets/11.svg',),
                    SizedBox(width: 5.0,),
                    // This takes in the number of total number of Completed Orders for the resturant. and i would find a better image for it
                    CreateCharts(description:'Completed', value: '57', svgPath:"assets/14.svg")
                  ],
                ),   
              ],
            ),
          ),

          SizedBox(height: 10.0,),

          Text("Trending Orders",style: TextStyle(fontWeight:FontWeight.bold,)),

          SizedBox(height: 10.0,),

          Container(
            height:90.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                // Trending orders can include as many orders as possible.
               TrendingOrders(imgPath:'assets/plate1.png', foodName:"Spaghetti", price:'\$30', unit:"70"),
               TrendingOrders(imgPath:'assets/plate2.png', foodName:"Yam and Chicken", price:'\$50', unit:"40"),
               TrendingOrders(imgPath:'assets/plate3.png', foodName:"Small Chops", price:'\$60', unit:"32"),
               TrendingOrders(imgPath:'assets/plate4.png', foodName:"Jollof Rice", price:'\$45', unit:"20"),
              ],
            ),
          )
        ],
      ),
    );
  }
}