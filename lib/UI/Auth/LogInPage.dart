import 'package:cehapi/Services/AuthService.dart';
import 'package:cehapi/UI/SharedWidgets/FormFields/CustomTextFormField.dart';
import 'package:cehapi/UI/SharedWidgets/Loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  final Function toggleView;

  LogInPage({this.toggleView});

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String error = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Connexion")),
        body: loading ? Loading() : Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField.withType(
                TextType.email,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              CustomTextFormField.withType(TextType.password,
                  onChanged: (value) {
                setState(() {
                  password = value;
                });
              }),
              _buildErrorText(),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('Se connecter'),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.logInWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() {
                            loading = false;
                            error = 'Email ou mot de passe faux';
                          });
                        }
                      }
                    },
                  )),
              Center(
                child: InkWell(
                    onTap: widget.toggleView,
                    child: Text("Pas encore de compte ? Inscris-toi vite !")),
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Se connecter plus tard'),
                      onPressed: () async {
                        dynamic result = await _auth.logInAnonymous();
                        if (result == null) {
                          print('error');
                        } else {
                          print('signed in');
                          print(result.uid);
                        }
                      })),
            ],
          ),
        ));
  }

  Widget _buildErrorText() {
    if (error.isNotEmpty) {
      return Center(
        child: Text(error, style: TextStyle(color: Colors.red),),
      );
    }
    return Container();
  }
}
