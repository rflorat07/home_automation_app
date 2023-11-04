import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart' as rive;

import '../../../../styles/styles.dart';

class LoadingPage extends ConsumerStatefulWidget {
  static const String route = '/loading';
  const LoadingPage({super.key});

  @override
  ConsumerState<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  late rive.StateMachineController smController;
  late rive.RiveAnimation animation;
  Map<Brightness, rive.SMIBool> states = {};
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      './assets/anims/flicky.riv',
      artboard: 'flickylogo',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  @override
  void dispose() {
    smController.dispose();
    super.dispose();
  }

  void onRiveInit(rive.Artboard artboard) {
    smController =
        rive.StateMachineController.fromArtboard(artboard, 'flickylogo')!;

    artboard.addController(smController);

    for (var theme in Brightness.values) {
      states[theme] = smController.findInput<bool>(theme.name) as rive.SMIBool;
      states[theme]!.value = false;
    }

    setState(() {
      states[MediaQuery.platformBrightnessOf(context)]!.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.platformBrightnessOf(context);

    if (isInitialized) {
      for (var valueThemes in Brightness.values) {
        states[valueThemes]!.value = theme == valueThemes;
      }
    }

    return Scaffold(
      body: Center(
        child: SizedBox(
            width: HomeAutomationStyles.loadingIconSize,
            height: HomeAutomationStyles.loadingIconSize,
            child: animation),
      ),
    );
  }
}
