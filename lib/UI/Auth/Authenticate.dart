import 'package:cehapi/UI/Auth/LogInPage.dart';
import 'package:cehapi/UI/Auth/SignUp/SignUpPage.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogIn = true;
  void toggleView(){
    setState(() => showLogIn = !showLogIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogIn) {
      return LogInPage(toggleView:  toggleView);
    } else {
      return SignUpPage(toggleView:  toggleView);
    }
  }
}