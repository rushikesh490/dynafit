import 'package:dynafit/views/assessments/cubit/assessment_cubit.dart';
import 'package:dynafit/views/assessments/screen/assessments.dart';
import 'package:dynafit/views/home/cubit/home_cubit.dart';
import 'package:dynafit/views/home/screen/home_screen.dart';
import 'package:dynafit/views/sign_in/screen/sign_in_screen.dart';
import 'package:dynafit/views/sign_up/screen/sign_up_screen.dart';
import 'package:dynafit/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes{
  static const String splash = "/";
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String assessments = "/assessments";
  static const String home = "/home";

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
        path: signUp,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.assessments,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (_) => AssessmentCubit(),
            child: const Assessments(),
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
    ],
  );

}