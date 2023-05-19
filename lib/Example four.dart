import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http ;

class Examplefour extends StatefulWidget {
  const Examplefour({Key? key}) : super(key: key);

  @override
  State<Examplefour> createState() => _ExamplefourState();
}

class _ExamplefourState extends State<Examplefour> {
  //get api not make module

  var data1;
  Future<void> getUserApi()async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200){

      data1 = jsonDecode(response.body.toString());
    }
    else{

    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example Four'),),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi (),
                builder: (context,snapshort){
                if (snapshort.connectionState==ConnectionState.waiting){
                  return Text("Loading");
                }
                else {
                  return //Text(data1[0]['name'].toString());
                  ListView .builder(
                      itemCount: data1.length,
                      itemBuilder: (context,index){
                    return
                        Card(
                      child: Column(
                        children: [
                         ReusbleRow(title: "name", value: data1[index]['name'].toString())
                        ],
                      ),
                    );
                  });
                }
            }),
          )

        ],
      ),
    );
  }
}
class ReusbleRow extends StatelessWidget {
  String title, value;
  ReusbleRow({Key? key, required this.title ,required this.value }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text (value),
        ],
      ),
    );
  }
}

