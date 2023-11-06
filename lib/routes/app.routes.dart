import 'package:go_router/go_router.dart';

import '../features/intro/presentation/pages/loading.page.dart';
import '../features/intro/presentation/pages/splash.page.dart';
import '../features/landing/presentation/pages/home.page.dart';
import '../helpers/utils.dart';

class AppRoutes {
  static final route = GoRouter(
      routerNeglect: true,
      initialLocation: SplashPage.route,
      navigatorKey: Utils.mainNav,
      routes: [
        GoRoute(
          parentNavigatorKey: Utils.mainNav,
          path: SplashPage.route,
          builder: (context, state) {
            return const SplashPage();
          },
        ),
        GoRoute(
          parentNavigatorKey: Utils.mainNav,
          path: LoadingPage.route,
          builder: (context, state) {
            return const LoadingPage();
          },
        ),
        GoRoute(
          parentNavigatorKey: Utils.mainNav,
          path: HomePage.route,
          builder: (context, state) {
            return const HomePage();
          },
        ),
      ]);
}
