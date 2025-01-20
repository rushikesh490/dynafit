import 'package:dynafit/views/account/view/account_screen.dart';
import 'package:dynafit/views/dashboard/cubit/dashboard_cubit.dart';
import 'package:dynafit/views/dashboard/view/dashboard_screen.dart';
import 'package:dynafit/views/home/cubit/home_cubit.dart';
import 'package:dynafit/views/home/screen/home_screen.dart';
import 'package:dynafit/views/onboarding/cubit/onboarding_cubit.dart';
import 'package:dynafit/views/onboarding/screen/onboarding.dart';
import 'package:dynafit/views/personal_information/cubit/personal_information_cubit.dart';
import 'package:dynafit/views/personal_information/view/personal_information.dart';
import 'package:dynafit/views/sign_in/screen/sign_in_screen.dart';
import 'package:dynafit/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes{
  static const String splash = "/";
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String onboarding = "/onboarding";
  static const String dashboard = "/dashboard";
  static const String home = "/home";
  static const String account = "/account";
  static const String personalInformation = "/personalInformation";

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: signIn,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (_) => OnboardingCubit(),
            child: const Onboarding(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (_) => DashboardCubit(),
            child: const DashboardScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (_) => HomeCubit(),
            child: const HomeScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.account,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (_) => HomeCubit(),
            child: const AccountScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.personalInformation,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (_) => PersonalInformationCubit(),
            child: const PersonalInformation(),
          );
        },
      )
    ],
  );

}