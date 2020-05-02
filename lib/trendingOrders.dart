import 'package:flutter/material.dart';

class TrendingOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 240.0,  
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 1.0)
            )
          ],
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          
            // padding: const EdgeInsets.only(left:8.0),
              Container(
                  width: 50.0,
                  height: 70.0,
                  decoration:BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/plate1.png"),
                    ),
                    
                  ) ,
                  
              ),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Chicken Burger",
                style: TextStyle(fontWeight: FontWeight.bold),
                ),
              Row( 
                children: <Widget>[
                Text("Orders  ",style: TextStyle(fontSize: 13.0)),
                SizedBox(height: 20.0,),
                Text("75",style: TextStyle(color: Colors.red,fontSize:13.0,fontWeight: FontWeight.bold))
              ],)
            ],
          ),
          
          SizedBox(width: 15.0,),

          Text("\$30",
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ],
        ),
      ),
    );
  }
}