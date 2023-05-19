import 'dart:convert';

import 'package:apisest/Models/user_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleTree extends StatefulWidget {
  const ExampleTree({Key? key}) : super(key: key);

  @override
  State<ExampleTree> createState() => _ExampleTreeState();
}

class _ExampleTreeState extends State<ExampleTree> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUser() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUser(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 50,
                            shadowColor: Colors.indigo[100],
                           // margin:EdgeInsets.all(8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                 ReusbleRow(title: "Name : ", value: snapshot.data![index].name.toString()),
                                  ReusbleRow(title: "User : ", value: snapshot.data![index].username.toString()),
                                  ReusbleRow(title: "Email : ", value: snapshot.data![index].email.toString()),
                                  ReusbleRow(title: "Address : ", value: snapshot.data![index].address!.city.toString()+ " , "+snapshot.data![index].address!.geo!.lng.toString()),
                                ],
                              ),
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
