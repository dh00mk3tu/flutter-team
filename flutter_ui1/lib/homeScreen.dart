import 'package:flutter/material.dart';

import 'configuration.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30)
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   // boxShadow: shadowList
      // ),
      duration: Duration(milliseconds: 160),
      // color: Colors.white,

      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen?IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    
                  ), 
                  onPressed: (){
                    setState(() {
                      xOffset = 0;
                      yOffset = 0;
                      scaleFactor = 1;
                      isDrawerOpen = false;
                    });
                  },
                ): IconButton(
                                    
                  icon: Icon(Icons.menu),
                  onPressed: (){
                    setState(() {
                      xOffset = 140;
                      yOffset = 160;
                      scaleFactor = 0.7;
                      isDrawerOpen = true;
                    });
                  } 
                ),
                Column(
                  children: [
                    Text("Location"),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: primaryGreen,),
                        Text("India"),                       
                      ],                     
                    ),
                  ],                  
                ),
                CircleAvatar()
              ],
            ),
          ),
        ],
      ),
    );
  }
}