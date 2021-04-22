//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

void main ()=> runApp(demo());
class demo extends StatefulWidget{


  State<StatefulWidget> createState(){

    return demostate();
  }
}
class demostate extends State<demo>{

DeviceInfoPlugin devinf = DeviceInfoPlugin(); //

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,


      home:Scaffold(



        appBar: AppBar(
       leading: IconButton(
           icon: Icon(
             Icons.search_rounded,
             color: Colors.white,
             size: 50.0,
           ),),

          title :Text("About Device" ,style:  TextStyle(

            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontSize: 40),

        ),





        ),
        body:
          ListView(

           padding : const EdgeInsets.all(16.0),

              children : [
         FutureBuilder<AndroidDeviceInfo>(
 //we use here futurebuilder beacuse this is of async type
future: devinf.androidInfo,
         // initialData: InitialData,
builder:( BuildContext context,AsyncSnapshot snapshot ) {
  if(snapshot.hasData) {
    AndroidDeviceInfo inf = snapshot .data;
    return DataTable(


      columns: <DataColumn>[
        
        DataColumn(label: Text("Brand",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ),)
        ,

          tooltip:  "This is the brand of this device",

        ),
        DataColumn(label: Text(" ${inf.brand}",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ),),
         
        tooltip:  "This is the brand of this device",
  )

        
      ],
rows: <DataRow>[

  DataRow(cells :<DataCell>[
    DataCell(Text("Device",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ), ),),
    DataCell(Text(" ${inf.device}",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ),),),



  ]


  ),
  DataRow(cells :<DataCell>[
    DataCell(Text("HardWare",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ), ),),
    DataCell(Text(" ${inf.hardware}",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ),),),



  ]


  ),
  DataRow(cells :<DataCell>[
    DataCell(Text("HardWare",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ), ),),
    DataCell(Text(" ${inf.hardware}",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ),),),



  ]


  ),DataRow(cells :<DataCell>[
    DataCell(Text("Model",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ), ),),
    DataCell(Text(" ${inf.model}",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ),),),



  ]


  ),DataRow(cells :<DataCell>[
    DataCell(Text("Id",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ), ),),
    DataCell(Text(" ${inf.id}",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ),),),



  ]


  ),DataRow(cells :<DataCell>[
    DataCell(Text("Version",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ), ),),
    DataCell(Text(" ${inf.version.baseOS}",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ),),),



  ]


  ),DataRow(cells :<DataCell>[
    DataCell(Text("Fingerprint",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ), ),),
    DataCell(Text(" ${inf.fingerprint}",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ),),),



  ]


  ),DataRow(cells :<DataCell>[
    DataCell(Text("Display",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ), ),),
    DataCell(Text(" ${inf.display}",style: TextStyle(   fontSize: 20,     fontWeight: FontWeight.w300,    ),),),



  ]


  ),




],
      





        )


  ;

  }
  return CircularProgressIndicator();
},


              )
],

          ),



      ),


    );



  }

}