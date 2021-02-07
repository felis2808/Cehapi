import 'package:cehapi/Models/SpecialData/SpecialDataField.dart';
import 'package:flutter/material.dart';

enum LocationEnum { near_home, third_location, remotely }

class Location extends SpecialDataField {
  final LocationEnum _location;

  const Location(this._location, int code, String label, IconData iconData)
      : super(code, label, iconData);

  static const Location nearHome =
      Location(LocationEnum.near_home, 201, "Près de chez moi", Icons.home);

  static const Location thirdLocation = Location(LocationEnum.third_location,
      202, "Tiers-Lieu", Icons.transfer_within_a_station);

  static const Location remotely =
      Location(LocationEnum.remotely, 203, "A distance", Icons.cast);
}
