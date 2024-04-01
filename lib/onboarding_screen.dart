import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '/intro_pages/into_page1.dart';
import '/intro_pages/intro_page2.dart';
import '/intro_pages/intro_page3.dart';
import '/homepage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                isLastPage = (value == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text('Skip'),
                ),

                // dot indicators
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),

                // next
                isLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: const Text('Done'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text('Next'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
