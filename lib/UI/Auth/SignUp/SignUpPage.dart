import 'package:cehapi/Models/CustomUser.dart';
import 'package:cehapi/Services/DatabaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:cehapi/Services/AuthService.dart';
import 'package:cehapi/UI/Auth/SignUp/PreviousAndNextButton.dart';
import 'package:cehapi/UI/SharedWidgets/FormFields/CustomTextFormField.dart';
import 'package:cehapi/UI/SharedWidgets/Loading.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  final Function toggleView;

  SignUpPage({this.toggleView});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _auth = AuthService();
  final FirestoreService _database = FirestoreService();
  final FirebaseAuth _fauth = FirebaseAuth.instance;

  final _emailFormKey = GlobalKey<FormState>();
  final _necessaryInfoFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();

  int _page = 0;
  // -- Email page
  String _email = '';
  // -- Necessary informations about new user
  String _name = '', _firstname = '', _city = '';
  DateTime _date;
  // String urlPicture; // TODO créer un page où on peut mettre une photo de profil
  // We get city from Necessary informations
  // -- Password and Confirm Password
  String _password = '', _confirmPassword = '';

  bool _emailAlreadyUsed = false;
  bool _isVerifyingEmail = false;
  bool _samePassword = true;
  bool _loading = false;

  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inscription à Cêhapi")),
      body: _loading
          ? Loading()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  child: _buildbody(context, _page))),
    );
  }

  // ---------------
  // NAVIGATION
  // ---------------

  Widget _buildbody(BuildContext context, int page) {
    // Page 0 : Email
    // Page 1 : Necessary Info
    // Page 2 : Add profile picture -- OPTIONAL
    // Page 3 : About the address -- OPTIONNAL
    print(page);

    switch (page) {
      case 0:
        return _buildEmailForm(context);
        break;
      case 1:
        return _buildNecessaryInfoForm(context);
        break;
      case 2:
        return _buildAddProfilePicture(context);
        break;
      case 3:
        return _buildPassword(context);
        break;
      default:
        return Container(
          child: Text("erreur"),
        );
    }
  }

  // --------
  // PAGES
  // --------

  // EMAIL PAGE (We begin to verity if the email already exist in the authentication database)

  Widget _buildEmailForm(BuildContext context) {
    return Form(
      key: _emailFormKey,
      child: ListView(
        children: [
          CustomTextFormField.withType(
            TextType.email,
            initialValue: _email,
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
          ),
          Container(
              child: _emailAlreadyUsed
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Cet email est déja addressé à un compte",
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : null),
          PreviousAndNextButton(
            showPrevious: false,
            onTapNext: _emailOnTapNextButton(),
          ),
          Container(
            child: _isVerifyingEmail
                ? SpinKitThreeBounce(color: Colors.black, size: 20.0)
                : null,
          ),
        ],
      ),
    );
  }

  // NECESSARY INFORMATIONS PAGE
  Widget _buildNecessaryInfoForm(BuildContext context) {
    return Form(
      key: _necessaryInfoFormKey,
      child: ListView(
        children: [
          CustomTextFormField.withType(
            TextType.name,
            initialValue: _name,
            onChanged: (value) {
              setState(() {
                _name = value;
              });
            },
          ),
          CustomTextFormField.withType(
            TextType.firstname,
            initialValue: _firstname,
            onChanged: (value) {
              setState(() {
                _firstname = value;
              });
            },
          ),
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: CustomTextFormField.withType(
                    TextType.date,
                    controller: _dateController,
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
                child: Icon(Icons.date_range),
              )
            ],
          ),
          CustomTextFormField.withType(
            TextType.city,
            initialValue: _city,
            onChanged: (value) {
              setState(() {
                _city = value;
              });
            },
          ),
          PreviousAndNextButton(
            onTapPrevious: _onTapPreviousButton(),
            onTapNext: _necessaryInfoOnTapNextButton(),
          ),
        ],
      ),
    );
  }

  // ADD PROFILE PICTURE PAGE
  Widget _buildAddProfilePicture(BuildContext context) {
    return Column(
      children: [
        Text('Add Picture'),
        PreviousAndNextButton(
            nextLabel: 'Plus tard',
            onTapPrevious: _onTapPreviousButton(),
            onTapNext: _onTapIgnoreButton()),
      ],
    );
  }

  // PASSWORD PAGE
  Widget _buildPassword(BuildContext context) {
    return Form(
      key: _passwordFormKey,
      child: ListView(
        children: [
          CustomTextFormField.withType(
            TextType.password,
            initialValue: '',
            onChanged: (value) {
              setState(() {
                _password = value;
              });
            },
            onTap: () {
              setState(() {
                _samePassword = true;
              });
            },
          ),
          CustomTextFormField.withType(
            TextType.confirmPassword,
            initialValue: '',
            onChanged: (value) {
              setState(() {
                _confirmPassword = value;
              });
            },
            onTap: () {
              setState(() {
                _samePassword = true;
              });
            },
          ),
          Container(
            child: _samePassword
                ? null
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Les deux champs doivent être égaux",
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ),
          PreviousAndNextButton(
            showNext: false,
            onTapPrevious: _passwordOnTapPreviousButton(),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text('S\'inscrire à Cêhapi'),
                onPressed: () async {
                  if (_passwordFormKey.currentState.validate()) {
                    if (_password == _confirmPassword) {
                      setState(() {
                        print(_password);
                        print(_confirmPassword);
                        _loading = true;
                      });
                      _addUserToTheServer(); //for firebase
                    } else {
                      setState(() {
                        print('incorrect pwd');
                        print(_password);
                        print(_confirmPassword);
                        FocusScope.of(context).requestFocus(new FocusNode());
                        _password = '';
                        _confirmPassword = '';
                        _samePassword = false;
                        _passwordFormKey.currentState.reset();
                      });
                    }
                  }
                },
              )),
        ],
      ),
    );
  }

  // ---------
  // NAVIGATION
  // ---------

  // PREVIOUS BUTTON
  void Function() _onTapPreviousButton() {
    return () async {
      FocusScope.of(context).requestFocus(new FocusNode());
      setState(() {
        _page--;
      });
    };
  }

  void Function() _passwordOnTapPreviousButton() {
    return () async {
      FocusScope.of(context).requestFocus(new FocusNode());
      setState(() {
        _samePassword = true;
        _password = '';
        _confirmPassword = '';
        _page--;
      });
    };
  }

  // NEXT BUTTON
  void Function() _emailOnTapNextButton() {
    return () async {
      FocusScope.of(context).requestFocus(new FocusNode());
      if (_emailFormKey.currentState.validate()) {
        setState(() {
          _emailAlreadyUsed = false;
          _isVerifyingEmail = true;
        });
        List<String> methods = await _auth.fetchSignInMethodsForEmail(_email);
        print(methods);
        if (methods.isNotEmpty) {
          setState(() {
            _isVerifyingEmail = false;
            _emailAlreadyUsed = true;
          });
        } else {
          setState(() {
            _isVerifyingEmail = false;
            _page++;
          });
        }
      }
    };
  }

  void Function() _necessaryInfoOnTapNextButton() {
    return () async {
      FocusScope.of(context).requestFocus(new FocusNode());
      if (_necessaryInfoFormKey.currentState.validate()) {
        setState(() {
          _page++;
        });
      }
    };
  }

  // IGNORE BUTTON
  void Function() _onTapIgnoreButton() {
    return () async {
      FocusScope.of(context).requestFocus(new FocusNode());
      setState(() {
        _page++;
      });
    };
  }

  // DATE PICKER FIELD
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date ?? DateTime.now(),
        firstDate: DateTime(1901, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != _date)
      setState(() {
        _date = picked;
        _dateController.value =
            TextEditingValue(text: DateFormat.yMd().format(_date));
      });
  }

  // ---------
  // DATABASE
  // ---------

  void _addUserToTheServer() {
    if (_auth.signUpWithEmailAndPassword(_email, _password) != null) {
      CustomUser user = CustomUser(
          email: _email,
          name: _name,
          firstname: _firstname,
          birthdate: _date,
          city: _city);
      _database.createUserToFirestore(user);
      print('currentUser = ${user ?? ''}');
    } else {
      print('erreur d\'inscription');
      setState(() {
        _loading = false;
      });
    }
  }
}
