import 'package:carto/core/router/routes.dart';
import 'package:carto/features/Auth/login/ui/login.dart';
import 'package:carto/features/Auth/sign_up/ui/signup.dart';
import 'package:carto/features/details/presentation/details_screen.dart';
import 'package:carto/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.details:
        return MaterialPageRoute(builder: (_) => DetailsScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => Login());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => Signup());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
    }
  }
}
