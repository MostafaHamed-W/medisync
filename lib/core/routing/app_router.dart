import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/core/di/dependency_injection.dart';
import 'package:medisync/core/routing/routes.dart';
import 'package:medisync/features/home/ui/home_screen.dart';
import 'package:medisync/features/login/logic/cubit/login_cubit.dart';
import 'package:medisync/features/login/ui/login_screen.dart';  
import 'package:medisync/features/signup/logic/cubit/signup_cubit.dart';
import 'package:medisync/features/signup/ui/sign_up_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          // const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
