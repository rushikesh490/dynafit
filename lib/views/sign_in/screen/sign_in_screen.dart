import 'package:dynafit/core/app_theme/app_theme_cubit.dart';
import 'package:dynafit/core/constants/app_assets.dart';
import 'package:dynafit/core/constants/app_strings.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/core/routes/app_routes.dart';
import 'package:dynafit/ui_components/common_elevated_button/common_elevated_button.dart';
import 'package:dynafit/ui_components/common_textfield/common_text_field.dart';
import 'package:dynafit/ui_components/ver_spacer/ver_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isDarkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    isDarkTheme(context)
                        ? AppAssets.darkSigninBackground
                        : AppAssets.signInBackGround,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  )),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _title(),
                    _verSpacer(20),
                    _emailTextField(),
                    _verSpacer(10),
                    _passwordTextField(),
                    _verSpacer(10),
                    _signInButton(),
                    _verSpacer(20),
                    _signUpText(),
                    BlocBuilder<AppThemeCubit, AppThemeState>(
                      builder: (context, state) {
                        final isDarkMode = state.themeData.brightness == Brightness.dark;
                        return ElevatedButton(
                            onPressed: () {
                              context.read<AppThemeCubit>().toggleTheme(!isDarkMode);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Change to "),
                                Text(isDarkMode?"Light":"Dark")
                              ],
                            )
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() => Text(
        AppStrings.signInToDynafit,
        style: AppTextStyles.semiBold20,
      );

  Widget _verSpacer(double value) => verSpacer(value);

  Widget _emailTextField() => CommonTextField(
        controller: _emailController,
        hintText: AppStrings.enterYourEmail,
      );

  Widget _passwordTextField() => CommonTextField(
        controller: _passwordController,
        hintText: AppStrings.enterYourPassword,
      );

  _signInButton() => CommonElevatedButton(
        onPressed: () {
          context.push(AppRoutes.assessments);
        },
        height: 63,
        isValid: true,
        text: AppStrings.signIn,
      );

  _signUpText() => GestureDetector(
    onTap: (){
      context.push(AppRoutes.signUp);
    },
    child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.dontHaveAnAccount, style: AppTextStyles.regular14),
            horizontalSpacer(5),
            Text(AppStrings.signUp, style: AppTextStyles.regular14),
          ],
        ),
  );
}
