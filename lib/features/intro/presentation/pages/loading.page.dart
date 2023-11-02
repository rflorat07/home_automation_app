import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  static const String route = '/loading';
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading Page'),
      ),
    );
  }
}
