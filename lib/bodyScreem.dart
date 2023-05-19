import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/postModels.dart';

class bodyScreen extends StatefulWidget {
  const bodyScreen({Key? key}) : super(key: key);

  @override
  State<bodyScreen> createState() => _bodyScreenState();
}

class _bodyScreenState extends State<bodyScreen> {
  List<PostsModel> PostList = [];

  Future<List<PostsModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        PostList.add(PostsModel.fromJson(i));
      }
      return PostList;
    
    } else {
      return PostList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
          child: Center(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text("Loading"));
                  } else {
                    return ListView.builder(
                        itemCount: PostList.length,
                        itemBuilder: (context, index) {
                         // return Text(index.toString());
                          return Card(
                            elevation: 100,
                            shadowColor: Colors.indigo[100],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text ("title \n"+PostList[index].title.toString()),
                          Text (PostList[index].title.toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
        ),
      ]
      ),
    );
  }
}
