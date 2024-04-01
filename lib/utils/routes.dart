import 'package:flutter/material.dart';
import 'package:resume_builder/views/build_options_screen.dart';
import 'package:resume_builder/views/home_screen.dart';
import 'package:resume_builder/views/resume_workspace.dart';
import 'package:resume_builder/views/splash_screen.dart';

class RoutingSettings {
  static Route<dynamic>? routes(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/splashScreen':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case '/homeScreen':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case '/buildOptionsScreen':
        return MaterialPageRoute(
          builder: (context) => const BuildOptionsScreen(),
        );
      case '/resumeWorkspace':
        return MaterialPageRoute(
          builder: (context) => const ResumeWorkspace(),
        );
      default:
        return null;
    }
  }
}
