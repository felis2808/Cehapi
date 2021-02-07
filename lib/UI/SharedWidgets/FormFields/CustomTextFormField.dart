import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextFormField extends StatefulWidget {
  final TextType type;
  final String label, hint, initialValue;
  final int maxLines, maxLength;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String Function(String) validator;
  final void Function(String) onChanged;
  final void Function() onTap;

  CustomTextFormField(
    this.type,
    this.label, {
    Key key,
    this.hint,
    this.initialValue = '',
    this.maxLines = 1,
    this.maxLength,
    this.obscureText = false,
    this.controller,
    this.textInputType,
    this.textInputAction = TextInputAction.done,
    this.validator = _basicValidator,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  factory CustomTextFormField.withType(TextType type,
      {String initialValue,
      TextEditingController controller,
      void Function(String) onChanged,
      void Function() onTap}) {
    switch (type) {
      // ----------
      // LOGIN & SIGN UP
      // ----------
      case TextType.username:
        return CustomTextFormField(
          type,
          "Username",
          initialValue: initialValue,
          onChanged: onChanged,
          onTap: onTap,
        );
        break;
      case TextType.email:
        return CustomTextFormField(
          type,
          "Email",
          initialValue: initialValue,
          onChanged: onChanged,
          textInputType: TextInputType.emailAddress,
          validator: _emailValidator,
          onTap: onTap,
        );
        break;
      case TextType.password:
        return CustomTextFormField(
          type,
          "Mot de passe",
          initialValue: initialValue,
          onChanged: onChanged,
          obscureText: true,
          onTap: onTap,
        );
        break;
      case TextType.name:
        return CustomTextFormField(
          type,
          "Nom",
          initialValue: initialValue,
          onChanged: onChanged,
          onTap: onTap,
        );
        break;
      case TextType.firstname:
        return CustomTextFormField(
          type,
          "Prénom",
          initialValue: initialValue,
          onChanged: onChanged,
          onTap: onTap,
        );
        break;
      case TextType.date:
        return CustomTextFormField(
          type,
          "Date de naissance",
          initialValue: initialValue,
          onChanged: onChanged,
          onTap: onTap,
          hint: "ex : 20/08/1990",
          textInputType: TextInputType.datetime,
          controller: controller,
          validator: _dateValidator,
        );
        break;
      case TextType.phone:
        return CustomTextFormField(
          type,
          "Numéro de téléphone",
          initialValue: initialValue,
          onChanged: onChanged,
          textInputType: TextInputType.phone,
          validator: _phoneValidator,
          onTap: onTap,
        );
        break;
      case TextType.address:
        return CustomTextFormField(
          type,
          "Adresse",
          initialValue: initialValue,
          onChanged: onChanged,
          onTap: onTap,
        );
        break;
      case TextType.postalCode:
        return CustomTextFormField(
          type,
          "Code Postal",
          initialValue: initialValue,
          onChanged: onChanged,
          textInputType: TextInputType.number,
          validator: _postalCodeValidator,
          onTap: onTap,
        );
        break;
      case TextType.city:
        return CustomTextFormField(
          type,
          "Ville",
          initialValue: initialValue,
          onChanged: onChanged,
          onTap: onTap,
        );
        break;
      case TextType.confirmPassword:
        return CustomTextFormField(
          type,
          "Confirmez votre mot de passe",
          initialValue: initialValue,
          onChanged: onChanged,
          obscureText: true,
          onTap: onTap,
        );

      // ------------
      // ADD PRODUCT
      // ------------
      case TextType.title:
        return CustomTextFormField(
          type,
          "Titre",
          initialValue: initialValue,
          onChanged: onChanged,
          hint: "ex: Produit 1",
          maxLength: 50,
          onTap: onTap,
        );
        break;
      case TextType.description:
        return CustomTextFormField(
          type,
          "Description",
          initialValue: initialValue,
          onChanged: onChanged,
          maxLines: 50,
          textInputAction: TextInputAction.newline,
          onTap: onTap,
        );
        break;
      default:
        return null;
    }
  }

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();

  // Validate functions

  static String _basicValidator(String value) {
    if (value.isEmpty) {
      return "Veuillez remplir ce champ";
    }
    return null;
  }

  static String _dateValidator(String value) {
    if (_basicValidator(value) != null) return _basicValidator(value);
    DateTime valueDate;
    try {
      valueDate = DateFormat.yMd().parse(value);
    } on FormatException catch (e) {
      return "Erreur lors de la validation de la date de naissance, veuillez réessayer";
    }
    DateTime now = DateTime.now();
    DateTime validDate = DateTime(now.year - 18, now.month, now.day);
    if (valueDate.isAfter(validDate))
      return "Vous n'avez pas l'âge pour accéder à cette application";
    return null;
  }

  static String _postalCodeValidator(String value) {
    if (_basicValidator(value) != null) return _basicValidator(value);
    if (int.tryParse(value) == null || value.length != 5)
      return "Veuillez un code postal correct";
    return null;
  }

  static String _phoneValidator(String value) {
    if (_basicValidator(value) != null) return _basicValidator(value);
    if (value.length < 10) {
      return "Veuillez un numéro de téléphone correct";
    }
    return null;
  }

  static String _emailValidator(String value) {
    if (_basicValidator(value) != null) return _basicValidator(value);
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return "Veuillez rentrer un email correct";
    }
    return null;
  }
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String initialValue;

  @override
  Widget build(BuildContext context) {
    if (widget.initialValue != null) {
      if (widget.initialValue.isNotEmpty) {
        initialValue = widget.initialValue;
      } else {
        initialValue = null;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: widget.controller,
        initialValue: initialValue,
        obscureText: widget.obscureText,
        minLines: 1,
        maxLength: widget.maxLength,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hint,
            border: OutlineInputBorder()),
        validator: widget.validator,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
      ),
    );
  }
}

enum TextType {
  username,
  email,
  password,
  name,
  firstname,
  date,
  phone,
  address,
  postalCode,
  city,
  confirmPassword,
  title,
  description
}
