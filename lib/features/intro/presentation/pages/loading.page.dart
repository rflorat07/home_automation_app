import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart' as rive;

import '../../../../helpers/enums.dart';
import '../../../../helpers/utils.dart';
import '../../../../styles/styles.dart';
import '../../../landing/presentation/pages/home.page.dart';
import '../providers/loading_page_providers.dart';

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
  Timer loadingTimer = Timer(Duration.zero, () {});

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
    loadingTimer.cancel();
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

    /* loadingTimer = Timer(const Duration(seconds: 2), () {
      GoRouter.of(Utils.mainNav.currentContext!).go(HomePage.route);
    }); */

    final loadingComplete = ref.watch(loadingNotificationVMProvider);
    final loadingMessage = ref.watch(loadingMessageProvider);

    if (loadingComplete == AppLoadingStates.success) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        GoRouter.of(Utils.mainNav.currentContext!).go(HomePage.route);
      });
    }

    Widget loadingIcon = const SizedBox.shrink();

    switch (loadingComplete) {
      case AppLoadingStates.none:
        Future.delayed(Duration.zero, () async {
          await ref
              .read(loadingNotificationVMProvider.notifier)
              .triggerLoading();
        });
        break;
      case AppLoadingStates.success:
        loadingIcon = Icon(
          Icons.check_circle_outline_outlined,
          color: Theme.of(context).colorScheme.primary,
        );
        break;
      case AppLoadingStates.loading:
        loadingIcon = const SizedBox(
          width: HomeAutomationStyles.mediumSize,
          height: HomeAutomationStyles.mediumSize,
          child: CircularProgressIndicator(),
        );
        break;
      case AppLoadingStates.error:
        loadingIcon = Icon(
          Icons.error_outline,
          size: HomeAutomationStyles.mediumIconSize,
          color: Theme.of(context).colorScheme.primary,
        );
        break;
    }

    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: SizedBox(
            width: HomeAutomationStyles.loadingIconSize,
            height: HomeAutomationStyles.loadingIconSize,
            child: animation,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            child: Column(
              key: ValueKey(loadingMessage),
              mainAxisSize: MainAxisSize.min,
              children: [
                loadingIcon,
                HomeAutomationStyles.smallVGap,
                Text(
                  loadingMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                HomeAutomationStyles.smallVGap,
              ]
                  .animate(
                    interval: 100.ms,
                  )
                  .slideY(
                    begin: 0.5,
                    end: 0,
                    duration: 0.25.seconds,
                    curve: Curves.easeInOut,
                  )
                  .fadeIn(
                    duration: 0.25.seconds,
                    curve: Curves.easeInOut,
                  ),
            ),
          ),
        )
      ],
    ));
  }
}
