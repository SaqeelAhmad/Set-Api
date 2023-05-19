

import 'package:apisest/bodyScreem.dart';
import 'package:apisest/post-Example-one.dart';
import 'package:apisest/user-list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'Example Tree.dart';
import 'Example four.dart';
import 'ExampleTwo.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'List User',
      //logo: AssetImage(''),
      onLogin: (_) => null,//Future(null),
      onSignup: (_) => null,//Future(null),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const PostOne(),
        ));
      },
      onRecoverPassword: (_) => null,//Future(null),
    );
  }
}