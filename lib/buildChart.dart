import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateCharts extends StatefulWidget {
  final String description;
  final String value;
  final String svgPath;
  CreateCharts({this.description, this.value, this.svgPath});

  @override
  _CreateChartsState createState() => _CreateChartsState();
}

class _CreateChartsState extends State<CreateCharts> {
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
              padding: const EdgeInsets.only(top:20.0, left:10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.description, style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),),
                  SizedBox(height:5.0),
                  Text(widget.value,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple[300]))
                ],
              ),
            ),),
            Expanded(flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(widget.svgPath),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}