import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FirstSplash extends StatelessWidget {
  const FirstSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 195, 191, 191),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 75),
          Lottie.asset(
            'Assets/animations/integrity.json',
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 24),
          Text(
            "We care about your integrity",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 24,
              fontFamily: "Inria Serif",
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "File Integrity monitoring works by creating a baseline and periodically analysing it to detect tampering or fraud",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 172),
        ],
      ),
    );
  }
}
