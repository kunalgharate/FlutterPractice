import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

 void main()
 {
    runApp( MaterialApp(
    home: MyApp()));
 }

 class MyApp extends StatefulWidget
 {
   @override
  _State createState() =>
    _State();
}
 class _State extends State<MyApp>
 {

   Map countries = Map();

   String data = "";

   void getData() async {
     final response = await http
         .get(Uri.parse('http://country.io/names.json'));

     if (response.statusCode == 200) {
       // If the server did return a 200 OK response,
       // then parse the JSON.
      // print(jsonDecode(response.body));
       setState((){
         countries = jsonDecode(response.body);
         data = jsonDecode(response.body).toString();
       });
     //  return jsonDecode(response.body); //jsonDecode(response.body);
     } else {
       // If the server did not return a 200 OK response,
       // then throw an exception.
       throw Exception('Failed to load album');
     }
   }





    @override
  Widget build(BuildContext context)
    {
      return Scaffold(
          appBar: AppBar(
            title: const Text("My APP"),
            backgroundColor: Colors.cyan,
          ),
        body: Container(padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
               Text("ListView Demo using Network call",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
              Expanded(child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (BuildContext context, int index)
                {
                  String key = countries.keys.elementAt(index);
                  return Row(
                    children: [
                      Card(child:Row(children: [
                        Text('$key :',style: TextStyle(fontSize: 14.0)),
                        Padding(padding: EdgeInsets.all(5),child:Text(countries[key],style: TextStyle(fontSize: 15.0),))
                      ],),),


                  ],
                  );

                },
                padding: EdgeInsets.all(20),
              ))




            ],
          ),
        ),),
      );
    }


   @override
  void initState() {
    getData();
  }

  void printData() {
     print("Image Clicked");
  }
}