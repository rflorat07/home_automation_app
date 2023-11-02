import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routes/app.routes.dart';

void main() {
  runApp(const ProviderScope(child: HomeAutomationApp()));
}

class HomeAutomationApp extends StatelessWidget {
  const HomeAutomationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: AppRoutes.route.routeInformationProvider,
      routeInformationParser: AppRoutes.route.routeInformationParser,
      routerDelegate: AppRoutes.route.routerDelegate,
    );
  }
}
