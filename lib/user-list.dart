import 'package:apisest/Login%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UserList extends StatelessWidget {
  final String apiUrl = "https://randomuser.me/api/?results=200";

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['results'];
  }

  String _name(dynamic user) {
    return user['name']['title'] +
        " " +
        user['name']['first'] +
        " " +
        user['name']['last'];
  }

  String _location(dynamic user) {
    return user['location']['country'];
  }

  String _age(Map<dynamic, dynamic> user) {
    return "Age: " + user['dob']['age'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        actions: [IconButton(onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
        }, icon: Icon(Icons.login_outlined))],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print(_age(snapshot.data[0]));
            return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  snapshot.data[index]['picture']['large'])),
                          title: Text(_name(snapshot.data[index])),
                          subtitle: Text(_location(snapshot.data[index])),
                          trailing: Text(_age(snapshot.data[index])),
                        ),
                        Container(
                          width: double.infinity,
                        ),
                        Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    snapshot.data[index]['picture']['large']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          height: 40,
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.thumb_up,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text('Like'),
                                  ],
                                ),
                              )),
                              Container(
                                  child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.comment,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text('Comment'),
                                  ],
                                ),
                              )),
                              Container(
                                  child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.share,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text('Share'),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
