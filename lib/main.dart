import 'package:docapp/core/rounting/app_route.dart';
import 'package:docapp/docp_app.dart';
import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';

void main() {
  setupGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

