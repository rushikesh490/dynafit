import 'package:dynafit/core/app_theme/app_theme_cubit.dart';
import 'package:dynafit/my_app/my_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppThemeCubit>(
          create: (context) => AppThemeCubit()..setInitialTheme(),
        ),
      ],
      child: const MyAppWidget(title: "Dynafit",),
    );
  }
}
