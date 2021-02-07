import 'package:cehapi/Models/SpecialData/Location.dart';
import 'package:cehapi/Models/SpecialData/ProductType.dart';
import 'package:cehapi/Models/SpecialData/SpecialDataField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SpecialDataEnum { user, type, location }

class SpecialData {
  static const _locationsList = <SpecialDataField>[
    Location.nearHome,
    Location.thirdLocation,
    Location.remotely
  ];

  static const _typeList = <SpecialDataField>[
    ProductType.service,
    ProductType.course,
    ProductType.equipment
  ];

  final String _label;
  final IconData _iconData;
  final SpecialDataEnum _dataEnum;
  final List<SpecialDataField> _list;

  SpecialDataEnum get dataEnum => _dataEnum;
  String get label => _label;
  IconData get iconData => _iconData;
  List<SpecialDataField> get list => _list;

  const SpecialData(this._dataEnum, this._label, this._iconData, this._list);

  static const SpecialData user =
      SpecialData(SpecialDataEnum.user, "User", Icons.person, null);

  static const SpecialData type =
      SpecialData(SpecialDataEnum.type, "Type", Icons.trip_origin, _typeList);

  static const SpecialData location = SpecialData(
      SpecialDataEnum.type, "Localisation", Icons.place, _locationsList);


}
