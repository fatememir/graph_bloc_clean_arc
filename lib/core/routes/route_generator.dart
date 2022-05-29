import 'package:flutter/material.dart';
import 'package:jan_with_base/features/login/presentation/pages/login_widget.dart';
// import 'package:jaan_flutter/config/routes/const.dart';
// import 'package:jaan_flutter/screens/authentication/authentication_screen.dart';
// import 'package:jaan_flutter/screens/authentication/authentication_view_model.dart';
// import 'package:jaan_flutter/screens/gratitude_screen.dart';
// import 'package:jaan_flutter/screens/home_screen.dart';
// import 'package:jaan_flutter/screens/login/login_screen.dart';
// import 'package:jaan_flutter/screens/login/login_view_model.dart';
// import 'package:jaan_flutter/screens/onboarding/onboarding_screen.dart';
// import 'package:jaan_flutter/screens/onboarding/onboarding_view_model.dart';
// import 'package:jaan_flutter/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import '../../features/authenticate/presentation/pages/authentication_screen.dart';
import '../../features/intro/presentation/pages/gratitude_screen.dart';
// import '../../features/intro/presentation/pages/splash_screen.dart';
import '../../features/splash_screen/presentation/pages/splash_screen.dart';
import 'const.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return Routes.fadeThrough(settings, (context) {
      switch (settings.name) {
        case RouteName.init:
          return  SplashScreen();
        case RouteName.gratitude:
          return const GratitudeScreen();
        case RouteName.login:
          return const LoginWidget();
        case RouteName.authentication :
          return const AuthenticationScreen();
        //   return MultiProvider(providers: [
        //     ChangeNotifierProvider(
        //       create: (_) => LoginViewModel(),
        //     ),
        //   ], child: const LoginScreen());
        // case RouteName.authentication:
        //   return MultiProvider(providers: [
        //     ChangeNotifierProvider(
        //         create: (context) => AuthenticationViewModel()),
        //   ], child: const AuthenticationScreen());
        // case RouteName.onboarding:
        //   return MultiProvider(providers: [
        //     ChangeNotifierProvider(
        //       create: (context) => OnboardingViewModel(),
        //     ),
        //   ], child: const OnboardingScreen());
        // case RouteName.home:
        //   return const HomeScreen();
        default:
          return _errorRoute(settings.name);
      }
    });
  }

  static Widget _errorRoute(routeName) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Text('ERROR : $routeName route not found'),
      ),
    );
  }
}

class Routes {
  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 400}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(1, 0), end: const Offset(0, 0))
                .animate(animation),
            child: child);
      },
    );
  }
}
