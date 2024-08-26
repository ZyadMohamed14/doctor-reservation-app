import 'package:docapp/core/rounting/app_route.dart';
import 'package:docapp/docp_app.dart';
import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DocApp(appRouter: AppRouter())
    );
  }
}

