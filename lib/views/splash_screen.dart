import 'package:flutter/material.dart';
import 'package:resume_builder/common_widgets/text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  homeRoute() async {
    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) => Navigator.pushNamed(context, '/homeScreen'),
    );
  }

  @override
  void initState() {
    super.initState();
    homeRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: 400,
            child: Image.asset(
              'assets/spalsh.png',
              fit: BoxFit.contain,
            ),
          ),
          TextWidget(
            title: 'Resume Builder',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
