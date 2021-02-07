import 'package:cehapi/Models/CustomUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // --------------
  // USER COLLECTION
  // --------------

  // Reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  // CREATE
  Future<void> createUserToFirestore(CustomUser user) {
    // Call the user's CollectionReference to add a new user
    return usersCollection
        .doc(user.uid)
        .set({
          CustomUser.fEMAIL: user.email,
          CustomUser.fNAME: user.name,
          CustomUser.fFIRSTNAME: user.firstname,
          CustomUser.fBIRTHDATE: Timestamp.fromDate(user.birthdate),
          CustomUser.fCITY: user.city,
        })
        .then((value) => print("CustomUser Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // CONVERT
  CustomUser _customUserFromSnapshot(DocumentSnapshot snapshot) {
    return CustomUser(
      uid: snapshot.id,
      email: snapshot.data()[CustomUser.fEMAIL],
      name: snapshot.data()[CustomUser.fNAME],
      firstname: snapshot.data()[CustomUser.fFIRSTNAME],
      birthdate: snapshot.data()[CustomUser.fBIRTHDATE],
      city: snapshot.data()[CustomUser.fCITY],
    );
  }

  // GET
  Stream<CustomUser> getUserFromFirestore(String uid) {
    return usersCollection.doc(uid).snapshots().map(_customUserFromSnapshot);
  }

  // UPDATE
  Future<void> updateUser(CustomUser user) {
    // Call the user's CollectionReference to add a new user
    return usersCollection
        .doc(user.uid)
        .set({
          CustomUser.fEMAIL: user.email,
          CustomUser.fNAME: user.name,
          CustomUser.fFIRSTNAME: user.firstname,
          CustomUser.fBIRTHDATE: Timestamp.fromDate(user.birthdate),
          CustomUser.fCITY: user.city,
        })
        .then((value) => print("CustomUser Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

}
