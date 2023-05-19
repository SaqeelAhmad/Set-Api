import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'Models/postModels.dart';
/*
class ExampleFive extends StatefulWidget {
  const ExampleFive({Key? key}) : super(key: key);

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {

  Future<PostsModel> getProductsApi()async{
final response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    var data = jsonDecode(response.body.toString());
if (response.statusCode == 200){
  return PostsModel.fromJson(data);
}else{
  return PostsModel.fromJson(data);
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(child: FutureBuilder<PostsModel>(
          future: getProductsApi(),
          builder: (context,snapshot){

            if(snapshot.hasData){
            return ListView .builder(
              itemCount: snapshot.data!.data!.length,
                itemBuilder: (context,index){
              return Column(
                children: [
                  Text(index.toString()),

                ],
              );
            });
            }
            else{
             return Text("loading");
            }

          },
        )),

      ],),
    );
  }
}

 */
