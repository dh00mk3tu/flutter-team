import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool funnyTheme = false; 
  String msg = "white priviledge";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: funnyTheme?ThemeData.dark():ThemeData.light(),
      home: HomePage(),
    );
  }



  Widget HomePage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("DARK THEME"),

      ),
      body: Center(
        child: Text("$msg"),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("funny theme"),
              trailing: Switch(
                value: funnyTheme,
                onChanged: (changedTheme){
                  setState(() {
                    funnyTheme = changedTheme;
                    msg = "racist app hehe";
                  });
                },
              ),
            )
          ],
        ),
      ),  
    );
  }
}