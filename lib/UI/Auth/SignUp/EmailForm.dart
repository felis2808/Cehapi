import 'package:flutter/material.dart';

import 'package:cehapi/Services/AuthService.dart';
import 'package:cehapi/UI/Auth/SignUp/PreviousAndNextButton.dart';
import 'package:cehapi/UI/SharedWidgets/FormFields/CustomTextFormField.dart';

class EmailForm extends StatefulWidget {
  final GlobalKey<FormState> emailFormKey;
  final String email;
  final bool emailAlreadyUsed;
  void Function(String) onChangedEmailField;
  void Function() onTapNext;

  EmailForm({
    this.emailFormKey,
    this.email,
    this.emailAlreadyUsed,
    this.onChangedEmailField,
    this.onTapNext,
    Key key}
  ) : super(key: key);

  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  @override
  Widget build(BuildContext context) {
    //We begin to verity if the email already exist in the authentication database

    return Form(
      key: widget.emailFormKey,
      child: ListView(
        children: [
          CustomTextFormField.withType(TextType.email,
              initialValue: widget.email,
              onChanged: widget.onChangedEmailField),
          PreviousAndNextButton(
            showPrevious: false,
            onTapNext: widget.onTapNext,
          )
        ],
      ),
    );
  }
}
