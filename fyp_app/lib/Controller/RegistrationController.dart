// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Repository/AuthenticationRepo.dart';

class RegistrationController extends GetxController {
  static RegistrationController get instance => Get.find();

  // final region = TextEditingController();
  // final idNumber = TextEditingController();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  bool value = false;
  
  final pageViewController = PageController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .creatUserWithEmailAndPassword(email, password);
  }
}
