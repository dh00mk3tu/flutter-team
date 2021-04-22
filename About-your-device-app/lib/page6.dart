import 'Package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

void main() => runApp(Od());

class Od extends StatefulWidget {
  @override
  Tstate createState() => Tstate();
}

class Tstate extends State<Od> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightGreen,
          title: Text(" Ducati pinagle Gallery "),
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context)

            // Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 200.0,
                width: double.infinity,
                child: Carousel(dotSize: 4.0, images: [
                  Center(
                    child: Image.asset(
                      "assets/d1.jpg",
                      fit: BoxFit.cover,
                      width: 350,
                    ),
                  ),
                  Image.asset(
                    "assets/d2.jpg",
                    width: 350,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/d3.jpg",
                    fit: BoxFit.cover,
                    width: 350,
                  ),
                  Image.asset(
                    "assets/d4.jpg",
                    fit: BoxFit.cover,
                    width: 350,
                  ),
                ],),
              ),

              Text("        ducati pinagle   ", style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
              Text (  '  Cooling	      :     Liquid Cooling'),
              Text (  ' Displacement  :	  1200 cc'),
              Text (  '  Maximum Torque  :	 83 Nm @ 8000 rpm'),


              Text (  '  Number of Cylinders	 :   4'),
              Text (  '   Ignition   	:   Digita '),
              Text('Compression Ratio :	11.9:1'),
              Text('TextBore	:  71 mm'),
              Text ('Stroke  :	50.9 mm'),
              Text('Cylinder Configuration	  :  In-Line Four'),
              Text('Valve System	DOHC   : 16 valves'),


            ],
          ),
        ),
      ),
    );
  }
}
