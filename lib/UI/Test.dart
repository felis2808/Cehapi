import 'dart:core';

import 'package:cehapi/Models/SpecialData/Location.dart';
import 'package:cehapi/Models/SpecialData/SpecialData.dart';
import 'package:cehapi/Models/SpecialData/SpecialDataField.dart';
import 'package:flutter/material.dart';

enum Choice { location, type }

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Page Test")),
        );
  }

  
}
