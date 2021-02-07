import 'package:flutter/cupertino.dart';

class SpecialDataField {
  final int _code;
  final String _label;
  final IconData _iconData;

  int get code => _code;
  String get label => _label;
  IconData get iconData => _iconData;

  const SpecialDataField(this._code, this._label, this._iconData);
}
