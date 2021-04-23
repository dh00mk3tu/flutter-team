import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';


void main()=>runApp(Myapp());

class Myapp extends StatefulWidget{

  State<StatefulWidget>createState ()
{
 return MyappState();
}

}
class MyappState extends State<Myapp>{

  TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  Model user;
  // List displayData;
  var data; //to increment post request


  Future <Model> createuser(String name, String jobtitle ) async{
    String clear = ""; 
    final String url = "https://reqres.in/api/users";
    final response =  await http.post(Uri.parse(url) ,
      body : {
        "name" : name ,
        "job" :jobtitle
      }
    );
    data = response.body;
    print(data);
  
   if(response.statusCode ==201){
     this.nameController.text = clear;
     this.jobController.text = clear;
    //  String respo = response.body;
     return modelFromJson(response.body);
    
   }
   else{
     return null;
   }
  }

  void checkField() {   
    print("here in function, enter something"); 
  }

  Future<List> dispUser(){
    List displayData = data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("json post pandey")
        ),
          body :Container(
            padding: EdgeInsets.all(32),
            child: SingleChildScrollView(
              child :
                Column(
                  children: [
                    TextField(
                      controller :nameController,
                    ),
                    TextField(
                      controller :jobController,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    
                    if(user== null)
                      Container()
                    else 
        
                      // ListView.builder(
                      //   itemCount: data == null ? 0 : data.length,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return Container(
                      //       child: Center(
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.stretch,
                      //           children: <Widget>[
                      //             Card(
                      //               child: Container(
                      //                   child: Text(data[index]['name']),
                      //                   padding: const EdgeInsets.all(20.0)
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       )
                      //     );
                      //   }
                      // ),

                    Container(
                      child: Card(   
                        child : Text("The ${user.name} is created successfully at ${user.createdAt.toIso8601String()} with job id ${user.id}", ),
                      ), 
                    ),
                    // Container(
                    //   child: FutureBuilder(
                    //     future: dispUser(),
                    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
                    //       return ListView.builder(
                    //         itemCount: snapshot.data.length,
                    //         itemBuilder: (BuildContext context, int index) {
                    //           return ListTile(
                    //             title: Text(snapshot.displayData[index].name),
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
                    // )
                  ],
                )
            )
            
        ),

        floatingActionButton: FloatingActionButton(

          onPressed: () async  {
            if(nameController.text == "" || jobController.text == "") {
               checkField();
            }
            else {
              final String name = nameController.text;
              final String jobtitle = jobController.text;
              final Model m =  await createuser(name, jobtitle);
              
              setState(() {
                user = m;
                dispUser();
              });
            }

          },
          child: Icon(Icons.add),
        ),




      )

    );

  }

}