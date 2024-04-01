import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '/intro_pages/into_page1.dart';
import '/intro_pages/intro_page2.dart';
import '/intro_pages/intro_page3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.8),
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
            ),
          ),
        ],
      ),
    );
  }
}
