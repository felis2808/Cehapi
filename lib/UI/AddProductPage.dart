import 'dart:core';

import 'package:cehapi/Models/SpecialData/SpecialData.dart';
import 'package:cehapi/Models/SpecialData/SpecialDataField.dart';
import 'package:cehapi/UI/SharedWidgets/FormFields/CustomChoiceFormField.dart';
import 'package:cehapi/UI/SharedWidgets/FormFields/CustomTextFormField.dart';
import 'package:flutter/material.dart';

enum Choice { location, type }

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  SpecialDataField _location, _productType;
  String title = "", description = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Ajouter un nouveau produit")),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField.withType(TextType.title),
              CustomChoiceFormField(_location, SpecialData.location),
              CustomChoiceFormField(_productType, SpecialData.type),
              CustomTextFormField.withType(TextType.description),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print("Nouveau produit ajouté");
                      }
                    },
                  )),
            ],
          ),
        ));
  }
}
