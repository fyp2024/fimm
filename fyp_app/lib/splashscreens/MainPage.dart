// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

import 'GetStarted.dart';

class Fimm extends StatefulWidget {
  const Fimm({Key? key}) : super(key: key);

  @override
  State<Fimm> createState() => _FimmState();
}

class _FimmState extends State<Fimm> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToGetStarted(context);
    });
  }

  Future<void> navigateToGetStarted(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const GetStarted()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: 400,
        height: 800,
        decoration:  BoxDecoration(
          color: Colors.grey.shade900,
        ),
        padding:
            const EdgeInsets.only(left: 40, right: 35, top: 350, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 300,
              height: 75,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 60,
                    fontFamily: "Inria Serif",
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: 'FIMM',
                      style:
                          TextStyle(color: Color.fromARGB(255, 120, 116, 116)),
                    ),
                    // TextSpan(
                    //   text: '',
                    //   style: TextStyle(color: Colors.white),
                    // ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 304),
            Center(
              child: Container(
                width: 200,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
