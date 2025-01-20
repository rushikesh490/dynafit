import 'package:dynafit/core/app_theme/app_theme_cubit.dart';
import 'package:dynafit/core/constants/app_assets.dart';
import 'package:dynafit/core/constants/app_strings.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/core/firebase/firebase_auth_services/firebase_auth_services.dart';
import 'package:dynafit/core/routes/app_routes.dart';
import 'package:dynafit/core/utils/utils.dart';
import 'package:dynafit/my_app/my_app_widget.dart';
import 'package:dynafit/ui_components/common_elevated_button/common_elevated_button.dart';
import 'package:dynafit/ui_components/common_textfield/common_text_field.dart';
import 'package:dynafit/ui_components/ver_spacer/ver_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {

  final PageController pageController;
  const SignUpScreen({super.key,required this.pageController});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isDarkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  Future<void> signUp() async {
     if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty && _userNameController.text.isNotEmpty){
       String res = await FirebaseAuthServices().signUp(_userNameController.text, _emailController.text, _passwordController.text);
       if(res=="Success"){
         Utilities().showSnackBar(context, text: "Success");
       }else{
         Utilities().showSnackBar(context, text: "Some Error");
       }
    }else{
      Utilities().showSnackBar(context, text: AppStrings.fieldEmpty,isError: true);
    }
  }

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
                    _userNameTextField(),
                    _verSpacer(10),
                    _emailTextField(),
                    _verSpacer(10),
                    _passwordTextField(),
                    _verSpacer(10),
                    _signUpButton(),
                    _verSpacer(20),
                    _signInText(),
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
    AppStrings.signUpToDynafit,
    style: AppTextStyles.semiBold20,
  );

  Widget _verSpacer(double value) => verSpacer(value);

  Widget _userNameTextField() => CommonTextField(
    controller: _userNameController,
    hintText: AppStrings.enterYourName,
  );

  Widget _emailTextField() => CommonTextField(
    controller: _emailController,
    hintText: AppStrings.enterYourEmail,
  );

  Widget _passwordTextField() => CommonTextField(
    controller: _passwordController,
    hintText: AppStrings.enterYourPassword,
  );

  _signUpButton() => CommonElevatedButton(
    onPressed: () {
      // signUp();
    },
    height: 63,
    isValid: true,
    text: AppStrings.signUp,
  );

  _signInText() => GestureDetector(
    onTap: (){
      context.push(AppRoutes.signIn);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.alreadyHaveAnAccount, style: AppTextStyles.regular14),
        horizontalSpacer(5),
        Text(AppStrings.signUp, style: AppTextStyles.regular14),
      ],
    ),
  );
}
