import 'package:flutter/material.dart';
import 'package:streabuilder/ContactManager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bloc and stream',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Chip(
            label: Text("hehe counter",
              style: TextStyle(color: Colors.white)
            ),
            backgroundColor: Colors.purple[900],
          )
        ],
        title: Center(child: Text("stream adn bloc")),
      ),
      body: StreamBuilder<List<dynamic>>(
          stream: manager.contactList,
          builder: (context, snapshot) {
          List<dynamic> data = snapshot.data;
          return ListView.separated(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(data[index]),
              );
            },
            separatorBuilder: (context, index) => Divider(),
          );
      },)
    );
  }
}

