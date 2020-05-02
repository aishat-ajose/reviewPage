import 'package:flutter/material.dart';

class CreateCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container( 
        height: 100.0,
        width: MediaQuery.of(context).size.width/2 - 30,
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
          children: <Widget>[
            Expanded(flex: 1, child: 
            Padding(
              padding: const EdgeInsets.only(top:10.0, left:20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Net Earning", style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height:5.0),
                  Text("7,367",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple[300]))
                ],
              ),
            ),),
            Expanded(flex: 1,
            child: Padding(
              padding: const EdgeInsets.only( left: 10.0, right: 5.0),
              child: Icon(Icons.table_chart ,size: 60, color: Colors.blue.withOpacity(0.5),),
            ),)
          ],
        ),
      ),
    );
  }
}