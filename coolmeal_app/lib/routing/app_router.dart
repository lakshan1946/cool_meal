import 'package:coolmeal/repositories/authentication_repository.dart';
import 'package:coolmeal/screens/lets_start/ui/lets_Start.dart';
import 'package:coolmeal/screens/complete_profile/ui/complete_profile.dart';
import 'package:coolmeal/screens/meal_details/ui/meal_details.dart';
import 'package:coolmeal/screens/meal_plan_per_day/ui/meal_plan_details.dart';
import 'package:coolmeal/screens/meal_plan_per_week/meal_plan_per_week.dart';
import 'package:coolmeal/screens/splash_screen/splash_screen.dart';
import 'package:coolmeal/screens/verify_please/verify_please.dart';
import 'package:coolmeal/screens/welcome/ui/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/login_or_signup_cubit.dart';
import '../screens/create_password/ui/create_password.dart';
import '../screens/forget/ui/forget_screen.dart';
import '../screens/home/ui/home_screen.dart';
import '../screens/login/ui/login_screen.dart';
import '../screens/signup/ui/sign_up_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.forgetScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginOrSignupCubit>(
            create: (_) =>
                LoginOrSignupCubit(_.read<AuthenticationRepository>()),
            child: const ForgetScreen(),
          ),
        );

      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case Routes.verifyPlease:
        return MaterialPageRoute(
          builder: (_) => const VerifyPlease(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.createPassword:
        final arguments = settings.arguments;
        if (arguments is List) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<LoginOrSignupCubit>(
              create: (_) =>
                  LoginOrSignupCubit(_.read<AuthenticationRepository>()),
              child: CreatePassword(
                googleUser: arguments[0],
                credential: arguments[1],
              ),
            ),
          );
        }

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginOrSignupCubit>(
            create: (_) =>
                LoginOrSignupCubit(_.read<AuthenticationRepository>()),
            child: const SignUpScreen(),
          ),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginOrSignupCubit>(
            create: (_) =>
                LoginOrSignupCubit(_.read<AuthenticationRepository>()),
            child: const LoginScreen(),
          ),
        );

      case Routes.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        );

      case Routes.letsStart:
        return MaterialPageRoute(
          builder: (_) => const LetsStartPage(),
        );

      case Routes.profileCompletion:
        return MaterialPageRoute(
          builder: (_) => const ProfileCompletionScreen(),
        );

      case Routes.mealItem:
        final arguments = settings.arguments;
        if (arguments is List) {
          return MaterialPageRoute(
            builder: (_) => MealDetailsPage(
              mealName: arguments[0],
            ),
          );
        }

      case Routes.mealPlan:
        final arguments = settings.arguments;
        if (arguments is List) {
          return MaterialPageRoute(
            builder: (_) => MealPlanDetailsPage(
              index: arguments[0],
            ),
          );
        }
      
      case Routes.mealPlanPerWeek:
        final arguments = settings.arguments;
        if (arguments is List) {
          return MaterialPageRoute(
            builder: (_) => MealPlanPerWeekPage(
              mealPlanCollection: arguments[0],
            ),
          );
        }
    }
    return null;
  }
}
