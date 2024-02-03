// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Login/LoginScreen.dart';
import '../components/bottom_nav_bar.dart';
import 'firstsplash.dart';
import 'secondsplash.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final PageController _controller = PageController(initialPage: 0);
  int currentPage = 0;

  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoggedIn();
  }

  Future<void> checkLoggedIn() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    await Future.delayed(const Duration(seconds: 0));

    setState(() {
      isLoggedIn = (user != null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? const BottomNavBar() : buildGetStarted();
  }

  Widget buildGetStarted() {
    return GestureDetector(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: const [
                FirstSplash(),
                SecondSplash(),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 2,
                  effect: WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.grey.shade900,
                    dotHeight: 8,
                    dotWidth: 30,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (currentPage == 0)
                      GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Container(
                          width: 175,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (currentPage == 1)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginPage(
                              showRegisterPage: () {},
                            );
                          }));
                        },
                        child: Container(
                          width: 175,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    // if (currentPage == 1)
                    //   GestureDetector(
                    //     onTap: () {
                    //       Navigator.push(context,
                    //           MaterialPageRoute(builder: (context) {
                    //         return LoginPage(
                    //           showRegisterPage: () {},
                    //         );
                    //       }));
                    //     },
                    //     child: Container(
                    //       width: 125,
                    //       height: 50,
                    //       decoration: BoxDecoration(
                    //         color: const Color.fromARGB(255, 102, 10, 10),
                    //         borderRadius: BorderRadius.circular(25),
                    //       ),
                    //       child: const Center(
                    //         child: Text(
                    //           'Login',
                    //           style: TextStyle(
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
