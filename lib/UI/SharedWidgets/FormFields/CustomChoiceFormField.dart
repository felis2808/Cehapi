import 'package:cehapi/Models/SpecialData/SpecialData.dart';
import 'package:cehapi/Models/SpecialData/SpecialDataField.dart';
import 'package:flutter/material.dart';

class CustomChoiceFormField extends StatefulWidget {
  SpecialDataField dropDownValue;
  final SpecialData specialData;

  CustomChoiceFormField(this.dropDownValue, this.specialData) : super();

  @override
  _CustomChoiceFormFieldState createState() => _CustomChoiceFormFieldState();
}

class _CustomChoiceFormFieldState extends State<CustomChoiceFormField> {
  String _formLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(12),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: _formLabel,
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null) {
              return "Veuillez sélectionner un champ";
            }
            return null;
          },
          hint: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(widget.specialData.iconData,
                  color: Theme.of(context).hintColor),
              Text(widget.specialData.label),
            ],
          ),
          value: widget.dropDownValue,
          onChanged: (newValue) {
            setState(() {
              widget.dropDownValue = newValue;
              _formLabel = widget.specialData.label;
            });
          },
          items: widget.specialData.list
              .map<DropdownMenuItem>((SpecialDataField data) {
            return DropdownMenuItem(
                value: data.code,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(data.iconData),
                    Text(data.label),
                  ],
                ));
          }).toList(),
          isExpanded: true,
        ));
  }
}
