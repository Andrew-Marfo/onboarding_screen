import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent.withOpacity(
            0.3,
          ),
        ),
        title: const Text(
          'Onboarding App',
        ),
      ),
      body: const Center(
        child: Text(
          'This is the homepage',
        ),
      ),
    );
  }
}
