import 'package:flutter/material.dart';
class PostOne extends StatefulWidget {
  const PostOne({Key? key}) : super(key: key);

  @override
  State<PostOne> createState() => _PostOneState();
}

class _PostOneState extends State<PostOne> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Column(children: [
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Email'
          ),
        ),
        TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
              hintText: 'Password'
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.indigo,
            borderRadius: BorderRadius.circular(10)
          ),
          child: InkWell(

            child: Text("Login"),
          onTap: (){},),
        )
      ],),

    );
  }
}

