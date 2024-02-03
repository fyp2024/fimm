import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/bottom_nav_bar.dart';
import '../splashscreens/MainPage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const Fimm())
        : Get.offAll(() => const BottomNavBar());
  }

  Future<void> creatUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      firebaseUser.value != null
          ? Get.offAll(() => const BottomNavBar())
          : Get.to(() => const Fimm());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", 'No user found for that email.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red);
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", 'Wrong password provided for that user.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red);
      } else {
        e.message ??
            Get.snackbar("Error", 'An error occurred while signing in.',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.redAccent.withOpacity(0.1),
                colorText: Colors.red);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    }
  }
}
