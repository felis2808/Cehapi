import 'package:cehapi/Models/Address.dart';
import 'package:cehapi/Models/Product.dart';

class CustomUser {
  static final String fUID = 'uid',
      fEMAIL = 'email',
      fNAME = 'name',
      fFIRSTNAME = 'firstname',
      fBIRTHDATE = 'birthdate',
      fCITY = 'city',
      fWORKLOCATION = 'work_location';

  final String uid;
  final String email; //TODO email à vérifier
  final String name;
  final String firstname;
  final DateTime birthdate;
  final String picture;
  final String city;
  final Address workLocation;
  final List<Product> ownProducts;
  final List<Product> recentProducts;

  CustomUser({
    this.uid,
    this.email,
    this.name,
    this.firstname,
    this.birthdate,
    this.picture,
    this.city,
    this.workLocation,
    this.ownProducts,
    this.recentProducts,
  });
}
