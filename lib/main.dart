import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/screens/job_dashboard_screen.dart';

void main() {
  runApp(const HireHubApp());
}

class HireHubApp extends StatelessWidget {
  const HireHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HireHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: JobDashboardScreen(),
    );
  }
}
