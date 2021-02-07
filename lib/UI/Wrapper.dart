import 'package:cehapi/Models/CustomUser.dart';
import 'package:cehapi/UI/Auth/Authenticate.dart';
import 'package:cehapi/UI/Auth/LogInPage.dart';
import 'package:cehapi/UI/Auth/SignUp/SignUpPage.dart';
import 'package:cehapi/UI/MainPage/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    print("Wrapper : $user");

    if (user == null) {
      return Authenticate();
    } else {
      return MainPage();
    }
  }
}
