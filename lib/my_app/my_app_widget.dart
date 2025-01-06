import 'package:dynafit/core/app_theme/app_theme_cubit.dart';
import 'package:dynafit/core/routes/app_routes.dart';
import 'package:dynafit/next_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyAppWidget extends StatefulWidget {
  final String title;

  const MyAppWidget({super.key, required this.title});

  @override
  State<MyAppWidget> createState() => _MyAppWidgetState();
}

class _MyAppWidgetState extends State<MyAppWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: widget.title,
          theme: state.themeData,
          routerConfig: AppRoutes.router,
        );
      },
    );
  }
}

