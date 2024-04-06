import 'package:flutter/material.dart';
import 'package:resume_builder/views/build_options_screen.dart';
import 'package:resume_builder/views/carrier_objectives_screen.dart';
import 'package:resume_builder/views/contact_info_screen.dart';
import 'package:resume_builder/views/home_screen.dart';
import 'package:resume_builder/views/splash_screen.dart';

class RoutingSettings {
  static Route<dynamic>? routes(RouteSettings settings) {
    // ignore: unused_local_variable
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
      case '/contactInfoScreen':
        return MaterialPageRoute(
          builder: (context) => const ContactInfoScreen(),
        );
      case '/careerObjectivesScreen':
        return MaterialPageRoute(
          builder: (context) => const CarrierObjectives(),
        );
      default:
        return null;
    }
  }
}
