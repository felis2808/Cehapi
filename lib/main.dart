// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:cehapi/Services/AuthService.dart';
import 'package:cehapi/UI/AddProductPage.dart';
import 'package:cehapi/UI/Auth/LogInPage.dart';
import 'package:cehapi/UI/MainPage/MainPage.dart';
import 'package:cehapi/UI/ProfilePage.dart';
import 'package:cehapi/UI/SharedWidgets/Loading.dart';
import 'package:cehapi/UI/Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/CustomUser.dart';
import 'UI/Auth/SignUp/SignUpPage.dart';

/// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: <String, WidgetBuilder>{
          '/addProductPage': (BuildContext context) => AddProductPage(),
          '/profilePage': (BuildContext context) => ProfilePage(),
          '/signUpPage': (BuildContext context) => SignUpPage(),
          '/logInPage': (BuildContext context) => LogInPage(),
        },
      ),
    );
  }
}