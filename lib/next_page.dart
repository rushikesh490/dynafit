import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/app_theme/app_theme_cubit.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  bool isDarkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        final isDarkMode = state.themeData.brightness == Brightness.dark;
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.of(context).maybePop();
                }, child: Text("Back")),
                ElevatedButton(onPressed: () {
                  context.read<AppThemeCubit>().toggleTheme(!isDarkMode);
                }, child: Text("Theme Change")),
                Container(
                  height: 30,
                  width: 120,
                  color:isDarkTheme(context)? Colors.red:Colors.green,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
