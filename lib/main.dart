import 'package:flutter/material.dart';
import 'package:resume_builder/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      title: 'Resume Builder App',
      initialRoute: '/resumeWorkspace',
      onGenerateRoute: RoutingSettings.routes,
    );
  }
}
