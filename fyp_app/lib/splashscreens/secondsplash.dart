import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SecondSplash extends StatelessWidget {
  const SecondSplash({Key? key}) : super(key: key);

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
          const SizedBox(height: 120),
          Expanded(
            flex: 1,
            child: Lottie.asset(
              'Assets/animations/integrity.json',
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Unique Features",
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
            "Protect your files",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 173),
        ],
      ),
    );
  }
}
