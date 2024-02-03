import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Login/LoginScreen.dart';
import 'bottom_nav_bar.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        key: const ValueKey('auth-state-changes'),
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BottomNavBar();
          } else {
            return LoginPage(showRegisterPage: () {  },);
          }
        },
      ),
    );
  }
}
