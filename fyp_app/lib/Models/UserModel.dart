// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String fullName;
  final String email;
  final String address;
  final String mobileNumber;
  // final String password;
  // final String region;
  // final String idNumber;

  const UserModel({
    required this.email,
    // required this.password,
    required this.fullName,
    required this.address,
    required this.mobileNumber,
    // required this.region,
    // required this.idNumber,
  });

  toJson() {
    return {
      "FullName": fullName,
      // "Region": region,
      // "IdNumber": idNumber,
      "Email": email,
      // "Address": address,
      // "MobileNumber": mobileNumber,

      // "Password": password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      // idNumber: document.id,
      email: data["Email"],
      fullName: data["FullName"],
      address: data["Address"],
      mobileNumber: data["MobileNumber"],
      // region: data["Region"],
      // password: data["Password"],
    );
  }
}
