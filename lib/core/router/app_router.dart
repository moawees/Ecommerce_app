import 'package:carto/core/networking/dio_consumer.dart';
import 'package:carto/core/router/routes.dart';
import 'package:carto/core/widgets/main_view.dart';
import 'package:carto/features/cart/cubit/fetch_cart_cubit_cubit.dart';
import 'package:carto/features/cart/data/repo/cart_repo.dart';
import 'package:carto/features/cart/ui/cart_screen.dart';
import 'package:carto/features/home/cubit/drawer_cubit.dart';
import 'package:carto/features/home/data/models/products_model.dart';
import 'package:carto/features/login/cubit/login_cubit.dart';
import 'package:carto/features/login/data/repo/login_repo.dart';
import 'package:carto/features/login/ui/login.dart';
import 'package:carto/features/signup/cubit/sign_up_cubit.dart';
import 'package:carto/features/signup/data/repos/sign_up_repo.dart';
import 'package:carto/features/signup/ui/signup.dart';
import 'package:carto/features/details/presentation/details_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final LoginRepo loginRepo;
  AppRouter() : loginRepo = LoginRepo(api: DioConsumer(dio: Dio()));
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => DrawerCubit(),
                  child: MainView(),
                ));
      case Routes.details:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => DetailsScreen(
                  product: product,
                ));
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(
                    loginRepo,
                  ),
                  child: Login(),
                ));
      case Routes.signup:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SignUpCubit(
                    SignUpRepo(api: DioConsumer(dio: Dio())),
                  ),
                  child: Signup(),
                ));
      case Routes.cart:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => FetchCartCubit(
                    CartRepo(api: DioConsumer(dio: Dio())),
                  )..fetchCart(),
                  child: CartScreen(),
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
    }
  }
}
