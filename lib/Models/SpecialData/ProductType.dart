import 'package:cehapi/Models/SpecialData/SpecialDataField.dart';
import 'package:flutter/material.dart';

enum ProductTypeEnum { service, equipment, course }

class ProductType extends SpecialDataField {
  final ProductTypeEnum _type;

  const ProductType(this._type, int code, String label, IconData iconData)
      : super(code, label, iconData);

  static const ProductType service =
      ProductType(ProductTypeEnum.service, 100, "Service", Icons.polymer);

  static const ProductType course =
      ProductType(ProductTypeEnum.course, 101, "Cours", Icons.import_contacts);

  static const ProductType equipment =
      ProductType(ProductTypeEnum.equipment, 102, "Equipement", Icons.build);
      
}
